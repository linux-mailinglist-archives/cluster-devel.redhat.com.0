Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8F6633C4D
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Nov 2022 13:20:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669119649;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mgrL4mJi7VcpsANC7VNQEWo8u9v/kRd0GOsqrrE+Oi0=;
	b=VT+lS0WUpbYKJn5owP7W5FnLDHymhpeqNyWWUktYJiXGQ48vJPXrPUi9+47wqPCtBEGoHw
	0TplJB2DhwSQpgjcpYzDypdChdXnUb1MHE991cC7E5/zgbaNVmshuwjAp6x2oXLEyuHN64
	7IzJLQwa05WapCSDGQYuG7l0WyKZCpY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-PIpgbv-GMpi7emJ8oWrOyA-1; Tue, 22 Nov 2022 07:20:46 -0500
X-MC-Unique: PIpgbv-GMpi7emJ8oWrOyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2EC11C09B67;
	Tue, 22 Nov 2022 12:20:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE2CC1415102;
	Tue, 22 Nov 2022 12:20:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7B59A194658D;
	Tue, 22 Nov 2022 12:20:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D49751946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 22 Nov 2022 12:20:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B9888492B2A; Tue, 22 Nov 2022 12:20:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1E51492B17
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 12:20:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9726F101A528
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 12:20:42 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-aTBowGqUOK6ifKabFgqQmg-1; Tue, 22 Nov 2022 07:20:40 -0500
X-MC-Unique: aTBowGqUOK6ifKabFgqQmg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 81960B81A4A;
 Tue, 22 Nov 2022 12:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BB3C433C1;
 Tue, 22 Nov 2022 12:20:36 +0000 (UTC)
Message-ID: <a731e688122d1a6fdb2f7bdbd71d403fa110e9f2.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Joseph Qi <joseph.qi@linux.alibaba.com>, Mark Fasheh <mark@fasheh.com>, 
 Joel Becker <jlbec@evilplan.org>
Date: Tue, 22 Nov 2022 07:20:35 -0500
In-Reply-To: <0c6a44ff-409e-99b2-eaa9-fd6e87a9e104@linux.alibaba.com>
References: <20221120210004.381842-1-jlayton@kernel.org>
 <0c6a44ff-409e-99b2-eaa9-fd6e87a9e104@linux.alibaba.com>
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37)
MIME-Version: 1.0
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, hch@lst.de,
 cluster-devel@redhat.com, devel@lists.orangefs.org,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-afs@lists.infradead.org, ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-11-22 at 09:51 +0800, Joseph Qi wrote:
> Hi,
>=20
> On 11/21/22 4:59 AM, Jeff Layton wrote:
> > The file locking definitions have lived in fs.h since the dawn of time,
> > but they are only used by a small subset of the source files that
> > include it.
> >=20
> > Move the file locking definitions to a new header file, and add the
> > appropriate #include directives to the source files that need them. By
> > doing this we trim down fs.h a bit and limit the amount of rebuilding
> > that has to be done when we make changes to the file locking APIs.
> >=20
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  fs/9p/vfs_file.c          |   1 +
> >  fs/afs/internal.h         |   1 +
> >  fs/attr.c                 |   1 +
> >  fs/ceph/locks.c           |   1 +
> >  fs/cifs/cifsfs.c          |   1 +
> >  fs/cifs/cifsglob.h        |   1 +
> >  fs/cifs/cifssmb.c         |   1 +
> >  fs/cifs/file.c            |   1 +
> >  fs/cifs/smb2file.c        |   1 +
> >  fs/dlm/plock.c            |   1 +
> >  fs/fcntl.c                |   1 +
> >  fs/file_table.c           |   1 +
> >  fs/fuse/file.c            |   1 +
> >  fs/gfs2/file.c            |   1 +
> >  fs/inode.c                |   1 +
> >  fs/ksmbd/smb2pdu.c        |   1 +
> >  fs/ksmbd/vfs.c            |   1 +
> >  fs/ksmbd/vfs_cache.c      |   1 +
> >  fs/lockd/clntproc.c       |   1 +
> >  fs/lockd/netns.h          |   1 +
> >  fs/locks.c                |   1 +
> >  fs/namei.c                |   1 +
> >  fs/nfs/nfs4_fs.h          |   1 +
> >  fs/nfs_common/grace.c     |   1 +
> >  fs/nfsd/netns.h           |   1 +
> >  fs/ocfs2/locks.c          |   1 +
> >  fs/ocfs2/stack_user.c     |   1 +
>=20
> Seems it misses the related changes in:
> fs/ocfs2/stackglue.c
>=20

I was able to build ocfs2.ko just fine without any changes to
stackglue.c. What problem do you see here?

Thanks,
--=20
Jeff Layton <jlayton@kernel.org>

