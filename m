Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5E06382D7
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Nov 2022 04:49:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669348156;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=I2TD8YnyUVRKaNNBGvfs3pUWZDwIFw5kNMaApqkurhc=;
	b=SdVhF9hdjlRmwtn1okfbwKRhtqXUx611SLfSssoyTm0EfHWIBPiktO2zrrh8IqxivY4dtN
	xH7iXBfotsQobJq95OQCCS8M+H4WqV8lEhz+0XAn091TkIF1/c+8q5GFDb8b1M22/hYaFw
	0MiA7G7Q8wbxAE3Uqllf2a+uDi2mVsc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-VEcQHLOqOWKHqkvSBH0SMw-1; Thu, 24 Nov 2022 22:49:12 -0500
X-MC-Unique: VEcQHLOqOWKHqkvSBH0SMw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40CC5811E87;
	Fri, 25 Nov 2022 03:49:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 70D4D2024CBE;
	Fri, 25 Nov 2022 03:49:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 03F76194658F;
	Fri, 25 Nov 2022 03:49:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2A63F1946587 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Nov 2022 03:48:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 09A1B2027064; Fri, 25 Nov 2022 03:48:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01D9E2028E94
 for <cluster-devel@redhat.com>; Fri, 25 Nov 2022 03:48:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D57248BD4CB
 for <cluster-devel@redhat.com>; Fri, 25 Nov 2022 03:48:49 +0000 (UTC)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-645-NtBDRI4HOZKGE5xs3MCQCA-1; Thu,
 24 Nov 2022 22:48:46 -0500
X-MC-Unique: NtBDRI4HOZKGE5xs3MCQCA-1
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1oyPhG-006aFN-28; Fri, 25 Nov 2022 03:48:14 +0000
Date: Fri, 25 Nov 2022 03:48:14 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <Y4A6/ozhUncxbimi@ZenIV>
References: <20221120210004.381842-1-jlayton@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221120210004.381842-1-jlayton@kernel.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 20, 2022 at 03:59:57PM -0500, Jeff Layton wrote:

> --- /dev/null
> +++ b/include/linux/filelock.h
> @@ -0,0 +1,428 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_FILELOCK_H
> +#define _LINUX_FILELOCK_H
> +
> +#include <linux/list.h>
> +#include <linux/nfs_fs_i.h>

Umm... I'd add a comment along the lines of "struct file_lock has
a BS union by fs type; NFS side of things needs nfs_fs_i.h"

> +struct lock_manager_operations {
> +	void *lm_mod_owner;
> +	fl_owner_t (*lm_get_owner)(fl_owner_t);

Probably take fl_owner_t to some more neutral header...

> +#define locks_inode(f) file_inode(f)

Why do we still have that one, anyway?  Separate patch, obviously,
but I would take Occam's Razor to that entity...

> +struct files_struct;
> +extern void show_fd_locks(struct seq_file *f,
> +			 struct file *filp, struct files_struct *files);

If anything, that would be better off as fl_owner_t...  Again, a separate
patch.

