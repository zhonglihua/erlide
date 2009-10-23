/*******************************************************************************
 * Copyright (c) 2004 Eric Merritt and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at http://www.eclipse.org/legal/epl-v10.html
 * 
 * Contributors:
 *     Eric Merritt
 *******************************************************************************/
package org.erlide.core.internal;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.core.resources.ICommand;
import org.eclipse.core.resources.IProject;
import org.eclipse.core.resources.IProjectDescription;
import org.eclipse.core.resources.IProjectNature;
import org.eclipse.core.resources.IResource;
import org.eclipse.core.resources.IWorkspaceRoot;
import org.eclipse.core.resources.ResourcesPlugin;
import org.eclipse.core.runtime.CoreException;
import org.eclipse.core.runtime.NullProgressMonitor;
import org.erlide.core.ErlangPlugin;
import org.erlide.jinterface.util.ErlLogger;

/**
 * Simple project nature
 * 
 * 
 * @author Eric Merritt [cyberlync at yahoo dot com]
 */
public class ErlangNature implements IProjectNature {

	private IProject project;

	/**
	 * Not used yet; this is like ErlangCore for a specific project.
	 * 
	 * @param project
	 *            the project we want to know about (if it is null, null is
	 *            returned)
	 * @return the erlang nature for a project (or null if it does not exist for
	 *         the project)
	 * 
	 * @note: it's synchronized because more than 1 place could call
	 *        getErlangNature at the same time and more than one nature ended up
	 *        being created from project.getNature().
	 */
	public static synchronized ErlangNature getErlangNature(IProject project) {
		if (project != null && project.isOpen()) {
			try {
				IProjectNature n = project.getNature(ErlangPlugin.NATURE_ID);
				if (n instanceof ErlangNature) {
					return (ErlangNature) n;
				}
			} catch (CoreException e) {
				ErlLogger.info(e);
			}
		}
		return null;
	}

	/**
	 * @return all the Erlang natures available in the workspace (for opened and
	 *         existing projects)
	 */
	public static List<ErlangNature> getAllErlangNatures() {
		List<ErlangNature> natures = new ArrayList<ErlangNature>();
		IWorkspaceRoot root = ResourcesPlugin.getWorkspace().getRoot();
		IProject[] projects = root.getProjects();
		for (IProject project : projects) {
			ErlangNature nature = getErlangNature(project);
			if (nature != null) {
				natures.add(nature);
			}
		}
		return natures;
	}

	public static ErlangNature getPythonNature(IResource resource) {
		if (resource == null) {
			return null;
		}
		return getPythonNature(resource.getProject());
	}

	/**
	 * Configure the nature
	 * 
	 * @see org.eclipse.core.resources.IProjectNature#configure()
	 */
	public void configure() throws CoreException {
		final IProjectDescription description = project.getDescription();
		if (!hasBuildSpec(description.getBuildSpec())) {
			final ICommand[] old = description.getBuildSpec(), specs = new ICommand[old.length + 1];
			System.arraycopy(old, 0, specs, 0, old.length);
			final ICommand command = description.newCommand();
			command.setBuilderName(ErlangPlugin.BUILDER_ID);
			specs[old.length] = command;
			description.setBuildSpec(specs);
			project.setDescription(description, new NullProgressMonitor());
		}
	}

	/**
	 * deconfigure the nature
	 * 
	 * @see org.eclipse.core.resources.IProjectNature#deconfigure()
	 */
	public void deconfigure() throws CoreException {
		final IProjectDescription description = project.getDescription();
		final int count = getBuildSpecCount(description.getBuildSpec());
		if (count != 0) {
			final ICommand[] old = description.getBuildSpec();
			final ICommand[] specs = new ICommand[old.length - count];
			int i = 0;
			int j = 0;
			while (j < old.length) {
				if (!ErlangPlugin.BUILDER_ID.equals(old[j].getBuilderName())) {
					specs[i++] = old[j];
				}
				j++;
			}
			description.setBuildSpec(specs);
			project.setDescription(description, new NullProgressMonitor());
		}
	}

	/**
	 * Get the project
	 * 
	 * @see org.eclipse.core.resources.IProjectNature#getProject()
	 */
	public IProject getProject() {
		return project;
	}

	/**
	 * Set the project
	 * 
	 * @see org.eclipse.core.resources.IProjectNature#setProject(org.eclipse.core.resources.IProject)
	 */
	public void setProject(final IProject lproject) {
		project = lproject;
	}

	/**
	 * Test for buildspec
	 * 
	 * @param commands
	 * @return
	 */
	private boolean hasBuildSpec(final ICommand[] commands) {
		return getBuildSpecCount(commands) != 0;
	}

	/**
	 * Get spec count
	 * 
	 * @param commands
	 * @return
	 */
	private int getBuildSpecCount(final ICommand[] commands) {
		int count = 0;
		for (final ICommand element : commands) {
			if (ErlangPlugin.BUILDER_ID.equals(element.getBuilderName())) {
				count++;
			}
		}
		return count;
	}
}
