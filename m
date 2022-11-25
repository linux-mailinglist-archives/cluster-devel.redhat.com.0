Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F53F638E6D
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Nov 2022 17:44:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669394697;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=x53sQaWDa/88sDZr4eyy32ZPwwt0aIb86EtvxNAGN44=;
	b=JYAGWR5FKbE/0UmPyTnynx7W6QeYyhEArpA0iqvjIom24onCCnK2Gr8ppK0hQFaBwew/jR
	11o+5bH8WAz+3qsA7utCtH8r+hNekGYfDl/BYwxJwlFxJJPtHeS4WOowA8Eu3MxneaxLnF
	F8IKIokln62XXBnust/ftrQT0qor3BY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-WsQU7SvgOoeJbvEgG0LkfQ-1; Fri, 25 Nov 2022 11:44:50 -0500
X-MC-Unique: WsQU7SvgOoeJbvEgG0LkfQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6C78185A794;
	Fri, 25 Nov 2022 16:44:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B8492200BA99;
	Fri, 25 Nov 2022 16:44:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2FF0C194658F;
	Fri, 25 Nov 2022 16:44:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1A8E11946587 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Nov 2022 16:44:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 02A66492B0D; Fri, 25 Nov 2022 16:44:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF200492B08
 for <cluster-devel@redhat.com>; Fri, 25 Nov 2022 16:44:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF405101A52A
 for <cluster-devel@redhat.com>; Fri, 25 Nov 2022 16:44:45 +0000 (UTC)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-662-miPGhCJSPh2i_I8DMeCk-Q-1; Fri,
 25 Nov 2022 11:44:43 -0500
X-MC-Unique: miPGhCJSPh2i_I8DMeCk-Q-1
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1oyboR-006i8e-1U; Fri, 25 Nov 2022 16:44:27 +0000
Date: Fri, 25 Nov 2022 16:44:27 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <Y4Dw65Nzt4bX9esd@ZenIV>
References: <20221120210004.381842-1-jlayton@kernel.org>
 <Y4A6/ozhUncxbimi@ZenIV>
 <1d474f53670771f324745f597ec94b63a006d687.camel@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1d474f53670771f324745f597ec94b63a006d687.camel@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

On Fri, Nov 25, 2022 at 08:23:45AM -0500, Jeff Layton wrote:

> I left it in fs.h for now. Some of the file_operations prototypes need
> that typedef, and I figure that anyone who is including filelock.h will
> almost certainly need to include fs.h anyway. We could move it into a
> separate header too, but it's probably not worth it.
> 
> HCH mentioned years ago though that we should just get rid of fl_owner_t
> altogether and just use 'void *'. I didn't do it at the time because I
> was focused on other changes, but this might be a good time to change
> it.

Might be...

> > > +extern void show_fd_locks(struct seq_file *f,
> > > +			 struct file *filp, struct files_struct *files);
> > 
> > If anything, that would be better off as fl_owner_t...  Again, a separate
> > patch.
> 
> I'm not sure what you mean here. This prototype hasn't changed, and is
> only called from procfs.

Take a look at that function and its caller.  The use of 'files' argument there
is (and can be) only as an opaque pointer to be compared to ->fl_owner; at that
point it might be pointing to freed memory, for all we know (and give false
positives if already reused).

TBH, I'd never been able to finish the audit of files_struct pointers passed
into locks subsystem; there definitely are moments when code from fs/locks.c
is dealing with pointers to already freed instances - show_fd_locks() at the
very least.  They are not dereferenced, but beyond that...

