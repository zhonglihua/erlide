/*******************************************************************************
 * Copyright (c) 2004 Vlad Dumitrescu and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Vlad Dumitrescu
 *******************************************************************************/
package com.ericsson.otp.erlang;

import org.erlide.jinterface.rpc.Signature;

import com.ericsson.otp.erlang.OtpErlangObject;
import com.ericsson.otp.erlang.OtpOutputStream;

/**
 * Provides a Java representation of Erlang variables. !!! These are to NOT to
 * be sent to an Erlang node !!!! Their use is in pattern matching only.
 */
public class OtpVariable extends OtpErlangObject {

	private static final long serialVersionUID = -1L;

	private String name;
	private Signature sign;

	public OtpVariable(String n) {
		String[] v = n.split(":");
		this.name = v[0];
		if (v.length > 1) {
			this.sign = new Signature(v[1].charAt(0));
		} else {
			this.sign = new Signature('x');
		}
	}

	public String getName() {
		return this.name;
	}

	public Signature getSignature() {
		return this.sign;
	}

	@Override
	public String toString() {
		return "'%" + this.name + ":" + this.sign.kind + "'";
	}

	@Override
	public boolean equals(Object o) {
		if (!(o instanceof OtpVariable)) {
			return false;
		}

		final OtpVariable l = (OtpVariable) o;
		return this.name.equals(l.name) && this.sign.equals(l.sign);
	}

	@Override
	public int hashCode() {
		return this.name.hashCode() + this.sign.hashCode() * 31;
	}

	@Override
	public void encode(OtpOutputStream arg0) {
		// throw new NotImplementedException();
	}

}