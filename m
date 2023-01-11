Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C73C066589C
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Jan 2023 11:09:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673431787;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vTG8tkGkgzpoXSI2/xLzI6Hvg87vZDKZ00P9yxoHI64=;
	b=J1Pv+S++/qBB/uJVKao1yjT56/ewHc6cjZpZP+9lBZS5Q1TEUSqV4jiulXZ6QqprYlmG7l
	+yK73UNLnmw8uhe5g4HZE7TqFGZaqa4pqy7v594OIRNMo7xUEyio81vTtTKYTBlfIQeblO
	p/1xBvHkQFI+o6QBrxAUYYp/W2XBdFM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-sh7nvkybOAySZcXa4SIfLg-1; Wed, 11 Jan 2023 05:09:42 -0500
X-MC-Unique: sh7nvkybOAySZcXa4SIfLg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 253362807D6E;
	Wed, 11 Jan 2023 10:09:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1123E140EBF5;
	Wed, 11 Jan 2023 10:09:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B68B319465A3;
	Wed, 11 Jan 2023 10:09:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3194C1946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 11 Jan 2023 10:09:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EC72840C2004; Wed, 11 Jan 2023 10:09:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E52BB40C2064
 for <cluster-devel@redhat.com>; Wed, 11 Jan 2023 10:09:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9F8985A588
 for <cluster-devel@redhat.com>; Wed, 11 Jan 2023 10:09:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-_cINATUaO1Ct-MKZlZPZEA-1; Wed, 11 Jan 2023 05:09:30 -0500
X-MC-Unique: _cINATUaO1Ct-MKZlZPZEA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 918A061BCE;
 Wed, 11 Jan 2023 10:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD77C433F0;
 Wed, 11 Jan 2023 10:09:23 +0000 (UTC)
Message-ID: <b93df374c14a0841823da7d5fadd96a0077762c6.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Date: Wed, 11 Jan 2023 05:09:22 -0500
In-Reply-To: <Y74bDlSiEb2dRFSx@ZenIV>
References: <20230105211937.1572384-1-jlayton@kernel.org>
 <Y74bDlSiEb2dRFSx@ZenIV>
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH v2] filelock: move file locking
 definitions to separate header file
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Marc Dionne <marc.dionne@auristor.com>, linux-xfs@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Mike Marshall <hubcap@omnibond.com>,
 linux-cifs@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 Mark Fasheh <mark@fasheh.com>, Russell King <linux@armlinux.org.uk>,
 linux-afs@lists.infradead.org, cluster-devel@redhat.com,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Eric Van Hensbergen <ericvh@gmail.com>,
 linux-nfs@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 linux-fsdevel@vger.kernel.org, Joel Becker <jlbec@evilplan.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-arm-kernel@lists.infradead.org, Christian Brauner <brauner@kernel.org>,
 Paulo Alcantara <pc@cjr.nz>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Chuck Lever <chuck.lever@oracle.com>, ocfs2-devel@oss.oracle.com,
 Anna Schumaker <anna@kernel.org>, Steve French <stfrench@microsoft.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-01-11 at 02:12 +0000, Al Viro wrote:
> On Thu, Jan 05, 2023 at 04:19:29PM -0500, Jeff Layton wrote:
> > The file locking definitions have lived in fs.h since the dawn of time,
> > but they are only used by a small subset of the source files that
> > include it.
> >=20
> > Move the file locking definitions to a new header file, and add the
> > appropriate #include directives to the source files that need them. By
> > doing this we trim down fs.h a bit and limit the amount of rebuilding
> > that has to be done when we make changes to the file locking APIs.
> >=20
> > Reviewed-by: Xiubo Li <xiubli@redhat.com>
> > Reviewed-by: Christian Brauner (Microsoft) <brauner@kernel.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Reviewed-by: David Howells <dhowells@redhat.com>
> > Acked-by: Chuck Lever <chuck.lever@oracle.com>
> > Acked-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> > Acked-by: Steve French <stfrench@microsoft.com>
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
>=20
> Same question re git tree preferences (and my Acked-by in any case)

I'll take this one via the file locking tree as well. FWIW, I have some
other filelock API changes I'd like to propose, so I think that'll be
easier.

Thanks,
--=20
Jeff Layton <jlayton@kernel.org>

