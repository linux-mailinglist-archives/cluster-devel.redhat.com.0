Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A4567729AD2
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Jun 2023 14:57:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686315443;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v0uD81ECxR4MzwA+dkxuK5PkGpkvp5v7VFbQeIJzi2E=;
	b=WBW8fjpRTU5UOZGlVG3VWIKi/Lqa9+TdSynU3ttGz+WdpdaJGmdu7DKslpHLk4G2LYn1wP
	/K/jUZe2vkJCue6HAVHjfYtsMbLwwQxtx9TU0bplCoYvyeKQxK+xXwABosUrNjXYK/gYQB
	YwcRd/3NrZtH5WUSfazY7uba6hzrPTg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-HxcMB7i3NtG7sMxGc0JdCA-1; Fri, 09 Jun 2023 08:57:18 -0400
X-MC-Unique: HxcMB7i3NtG7sMxGc0JdCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5B92185A7AE;
	Fri,  9 Jun 2023 12:57:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24CA3C09A08;
	Fri,  9 Jun 2023 12:57:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 63A5519451D5;
	Fri,  9 Jun 2023 12:57:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0680F19451C1 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  9 Jun 2023 12:57:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1E49F20268CA; Fri,  9 Jun 2023 12:57:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1725420268C9
 for <cluster-devel@redhat.com>; Fri,  9 Jun 2023 12:57:05 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED501858F14
 for <cluster-devel@redhat.com>; Fri,  9 Jun 2023 12:57:04 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-QiwgruPdPoq48C274QPxrA-1; Fri, 09 Jun 2023 08:57:01 -0400
X-MC-Unique: QiwgruPdPoq48C274QPxrA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D0017657E1;
 Fri,  9 Jun 2023 12:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCFFC4339B;
 Fri,  9 Jun 2023 12:50:34 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Brad Warrum <bwarrum@linux.ibm.com>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ian Kent <raven@themaw.net>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Jeremy Kerr <jk@ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>,
 Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Ruihan Li <lrh2000@pku.edu.cn>,
 Suren Baghdasaryan <surenb@google.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 autofs@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org
Date: Fri,  9 Jun 2023 08:50:17 -0400
Message-Id: <20230609125023.399942-4-jlayton@kernel.org>
In-Reply-To: <20230609125023.399942-1-jlayton@kernel.org>
References: <20230609125023.399942-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 3/9] autofs: set ctime as well when mtime
 changes on a dir
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/autofs/root.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/autofs/root.c b/fs/autofs/root.c
index 6baf90b08e0e..93046c9dc461 100644
--- a/fs/autofs/root.c
+++ b/fs/autofs/root.c
@@ -600,7 +600,7 @@ static int autofs_dir_symlink(struct mnt_idmap *idmap,
 =09p_ino =3D autofs_dentry_ino(dentry->d_parent);
 =09p_ino->count++;
=20
-=09dir->i_mtime =3D current_time(dir);
+=09dir->i_mtime =3D dir->i_ctime =3D current_time(dir);
=20
 =09return 0;
 }
@@ -633,7 +633,7 @@ static int autofs_dir_unlink(struct inode *dir, struct =
dentry *dentry)
 =09d_inode(dentry)->i_size =3D 0;
 =09clear_nlink(d_inode(dentry));
=20
-=09dir->i_mtime =3D current_time(dir);
+=09dir->i_mtime =3D dir->i_ctime =3D current_time(dir);
=20
 =09spin_lock(&sbi->lookup_lock);
 =09__autofs_add_expiring(dentry);
@@ -749,7 +749,7 @@ static int autofs_dir_mkdir(struct mnt_idmap *idmap,
 =09p_ino =3D autofs_dentry_ino(dentry->d_parent);
 =09p_ino->count++;
 =09inc_nlink(dir);
-=09dir->i_mtime =3D current_time(dir);
+=09dir->i_mtime =3D dir->i_ctime =3D current_time(dir);
=20
 =09return 0;
 }
--=20
2.40.1

