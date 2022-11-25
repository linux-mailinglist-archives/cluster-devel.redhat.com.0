Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ED5638B19
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Nov 2022 14:24:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669382645;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zLKzqfxmfEUVx5LCSUAIxHld5MTcvWz031xEHPYyUBA=;
	b=XjxyBtg8sc8V2epLRknm8QZOVb8hrTptUUPuy9ceFxq8+EK3rVbJ5k4qQ8zZDnBDq1LvOH
	6WP2VhkCL6O2B5Gt6xMFrPBTq1aJPVNptP7HtxWrhijRAx4i/06wXSr68qRzFKlISMOz6e
	hrshI18gKjr2LSPdolBjJPNoEzCfZAU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-4dTQxE7NOW2gdw7FDFoLWQ-1; Fri, 25 Nov 2022 08:24:01 -0500
X-MC-Unique: 4dTQxE7NOW2gdw7FDFoLWQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C574685A588;
	Fri, 25 Nov 2022 13:24:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 471CE40C2064;
	Fri, 25 Nov 2022 13:23:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C5B15194658F;
	Fri, 25 Nov 2022 13:23:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4FAE41946587 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Nov 2022 13:23:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2D8DF200B40B; Fri, 25 Nov 2022 13:23:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2693C2028E94
 for <cluster-devel@redhat.com>; Fri, 25 Nov 2022 13:23:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6758185A7A3
 for <cluster-devel@redhat.com>; Fri, 25 Nov 2022 13:23:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-S1VqPC7XOHK813QoVjm81Q-1; Fri, 25 Nov 2022 08:23:54 -0500
X-MC-Unique: S1VqPC7XOHK813QoVjm81Q-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4995162404;
 Fri, 25 Nov 2022 13:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC855C433C1;
 Fri, 25 Nov 2022 13:23:46 +0000 (UTC)
Message-ID: <1d474f53670771f324745f597ec94b63a006d687.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Date: Fri, 25 Nov 2022 08:23:45 -0500
In-Reply-To: <Y4A6/ozhUncxbimi@ZenIV>
References: <20221120210004.381842-1-jlayton@kernel.org>
 <Y4A6/ozhUncxbimi@ZenIV>
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH] filelock: move file locking definitions
 to separate header file
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
 Marc Dionne <marc.dionne@auristor.com>, linux-xfs@vger.kernel.org, hch@lst.de,
 Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, Mark Fasheh <mark@fasheh.com>,
 linux-afs@lists.infradead.org, cluster-devel@redhat.com,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Eric Van Hensbergen <ericvh@gmail.com>,
 Tom Talpey <tom@talpey.com>, linux-fsdevel@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-nfs@vger.kernel.org,
 Paulo Alcantara <pc@cjr.nz>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Chuck Lever <chuck.lever@oracle.com>, Anna Schumaker <anna@kernel.org>,
 ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-11-25 at 03:48 +0000, Al Viro wrote:
> On Sun, Nov 20, 2022 at 03:59:57PM -0500, Jeff Layton wrote:
>=20
> > --- /dev/null
> > +++ b/include/linux/filelock.h
> > @@ -0,0 +1,428 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _LINUX_FILELOCK_H
> > +#define _LINUX_FILELOCK_H
> > +
> > +#include <linux/list.h>
> > +#include <linux/nfs_fs_i.h>
>=20
> Umm... I'd add a comment along the lines of "struct file_lock has
> a BS union by fs type; NFS side of things needs nfs_fs_i.h"
>=20

Ok.

> > +struct lock_manager_operations {
> > +=09void *lm_mod_owner;
> > +=09fl_owner_t (*lm_get_owner)(fl_owner_t);
>=20
> Probably take fl_owner_t to some more neutral header...
>=20

I left it in fs.h for now. Some of the file_operations prototypes need
that typedef, and I figure that anyone who is including filelock.h will
almost certainly need to include fs.h anyway. We could move it into a
separate header too, but it's probably not worth it.

HCH mentioned years ago though that we should just get rid of fl_owner_t
altogether and just use 'void *'. I didn't do it at the time because I
was focused on other changes, but this might be a good time to change
it.

> > +#define locks_inode(f) file_inode(f)
>=20
> Why do we still have that one, anyway?  Separate patch, obviously,
> but I would take Occam's Razor to that entity...
>=20

I can spin up a patch to nuke that too. I count only 30 callsites
remaining anyway.

> > +struct files_struct;
> > +extern void show_fd_locks(struct seq_file *f,
> > +=09=09=09 struct file *filp, struct files_struct *files);
>=20
> If anything, that would be better off as fl_owner_t...  Again, a separate
> patch.

I'm not sure what you mean here. This prototype hasn't changed, and is
only called from procfs.

--=20
Jeff Layton <jlayton@kernel.org>

