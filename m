Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9859B729B24
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Jun 2023 15:11:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686316267;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=d0FFKLdaDrpXRSPOp3UpyIXWkFGp/ifjWQbvEwdFwjQ=;
	b=bKhU9KsE0PBXwRYGQAf2isw89xfzKXnhbq/2pm1Sq52nqhQ+lg1ZHUf5c96KdFXnY/y0tM
	tl/OShdN5rGNJjfL9hHykX/jfRlJBM8ZtieKGvodMZOBxjoKd6qph61/6M1DOWCMx5B3Ps
	FDMPNi1Jp1y+fbQui6mHiCzjPzBbFbA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-fRMJeIe8PZ-obGJMOWAWog-1; Fri, 09 Jun 2023 09:11:04 -0400
X-MC-Unique: fRMJeIe8PZ-obGJMOWAWog-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 525B285A5BF;
	Fri,  9 Jun 2023 13:11:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D4D410DDC;
	Fri,  9 Jun 2023 13:11:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 03B4819451C3;
	Fri,  9 Jun 2023 13:11:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C2579194658C for <cluster-devel@listman.corp.redhat.com>;
 Fri,  9 Jun 2023 13:11:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6B1D3140E95B; Fri,  9 Jun 2023 13:11:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48466145B981
 for <cluster-devel@redhat.com>; Fri,  9 Jun 2023 13:11:01 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E673803DBE
 for <cluster-devel@redhat.com>; Fri,  9 Jun 2023 13:10:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-02gVUqOhMbm5zm072Z1GrQ-1; Fri, 09 Jun 2023 09:10:52 -0400
X-MC-Unique: 02gVUqOhMbm5zm072Z1GrQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70705657D8;
 Fri,  9 Jun 2023 13:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD84C433EF;
 Fri,  9 Jun 2023 13:10:50 +0000 (UTC)
Date: Fri, 9 Jun 2023 15:10:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <2023060931-magazine-nickname-f386@gregkh>
References: <20230609125023.399942-1-jlayton@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230609125023.399942-1-jlayton@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 0/9] fs: add some missing ctime updates
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
Cc: linux-efi@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Ruihan Li <lrh2000@pku.edu.cn>, Ard Biesheuvel <ardb@kernel.org>,
 Ian Kent <raven@themaw.net>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Ritu Agarwal <rituagar@linux.ibm.com>,
 James Morris <jmorris@namei.org>, cluster-devel@redhat.com,
 Namjae Jeon <linkinjeon@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Arnd Bergmann <arnd@arndb.de>,
 autofs@vger.kernel.org, apparmor@lists.ubuntu.com, Tom Talpey <tom@talpey.com>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>, Paul Moore <paul@paul-moore.com>,
 Christian Brauner <brauner@kernel.org>,
 John Johansen <john.johansen@canonical.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 linux-security-module@vger.kernel.org, Jeremy Kerr <jk@ozlabs.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Brad Warrum <bwarrum@linux.ibm.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linuxfoundation.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 09, 2023 at 08:50:14AM -0400, Jeff Layton wrote:
> While working on a patch series to change how we handle the ctime, I
> found a number of places that update the mtime without a corresponding
> ctime update. POSIX requires that when the mtime is updated that the
> ctime also be updated.
> 
> Note that these are largely untested other than for compilation, so
> please review carefully. These are a preliminary set for the upcoming
> rework of how we handle the ctime.
> 
> None of these seem to be very crucial, but it would be nice if
> various maintainers could pick these up for v6.5. Please let me know if
> you do.
> 
> Jeff Layton (9):
>   ibmvmc: update ctime in conjunction with mtime on write
>   usb: update the ctime as well when updating mtime after an ioctl
>   autofs: set ctime as well when mtime changes on a dir
>   bfs: update ctime in addition to mtime when adding entries
>   efivarfs: update ctime when mtime changes on a write
>   exfat: ensure that ctime is updated whenever the mtime is
>   gfs2: update ctime when quota is updated
>   apparmor: update ctime whenever the mtime changes on an inode
>   cifs: update the ctime on a partial page write
> 
>  drivers/misc/ibmvmc.c             |  2 +-
>  drivers/usb/core/devio.c          | 16 ++++++++--------
>  fs/autofs/root.c                  |  6 +++---
>  fs/bfs/dir.c                      |  2 +-
>  fs/efivarfs/file.c                |  2 +-
>  fs/exfat/namei.c                  |  8 ++++----
>  fs/gfs2/quota.c                   |  2 +-
>  fs/smb/client/file.c              |  2 +-
>  security/apparmor/apparmorfs.c    |  7 +++++--
>  security/apparmor/policy_unpack.c | 11 +++++++----
>  10 files changed, 32 insertions(+), 26 deletions(-)
> 
> -- 
> 2.40.1
> 

All of these need commit log messages, didn't checkpatch warn you about
that?

thanks,

greg k-h

