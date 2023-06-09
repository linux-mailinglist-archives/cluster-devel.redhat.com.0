Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F9F729AD3
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Jun 2023 14:57:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686315447;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0cTJeM07EMIKn83LLTOHn91RJclX61LhsRFu2LvJgnk=;
	b=LB97OfV5UzqrzmDEdqNJnR+YhMui0Ctz7JbHlCFGAkH7UbS24xHdUAXy5dOhau49PwG5qw
	FePz5LquM5QAcaa/I3dkXCjR/DgnpQNcKaQ+6eeGwmiTCF8CuPzsqHk/dtWXyfJ22PcMUw
	ARl0Szb79LmqG7hcZfimtZaHrQlVW2I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-xd88k36gOFWR9gjVaIRbGQ-1; Fri, 09 Jun 2023 08:57:18 -0400
X-MC-Unique: xd88k36gOFWR9gjVaIRbGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA3FB805994;
	Fri,  9 Jun 2023 12:57:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE78A1121315;
	Fri,  9 Jun 2023 12:57:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8F68019451E0;
	Fri,  9 Jun 2023 12:57:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0C06619451C6 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  9 Jun 2023 12:57:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 11952492B0C; Fri,  9 Jun 2023 12:57:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A6DF492B0A
 for <cluster-devel@redhat.com>; Fri,  9 Jun 2023 12:57:04 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E46F93C0D85A
 for <cluster-devel@redhat.com>; Fri,  9 Jun 2023 12:57:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-5t45P5BHNj-lRSl6UnmlPQ-1; Fri, 09 Jun 2023 08:57:02 -0400
X-MC-Unique: 5t45P5BHNj-lRSl6UnmlPQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D6966409B;
 Fri,  9 Jun 2023 12:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E991BC433D2;
 Fri,  9 Jun 2023 12:50:44 +0000 (UTC)
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
Date: Fri,  9 Jun 2023 08:50:20 -0400
Message-Id: <20230609125023.399942-7-jlayton@kernel.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH 6/9] exfat: ensure that ctime is updated
 whenever the mtime is
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/exfat/namei.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index e0ff9d156f6f..d9b46fa36bff 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -817,7 +817,7 @@ static int exfat_unlink(struct inode *dir, struct dentr=
y *dentry)
 =09ei->dir.dir =3D DIR_DELETED;
=20
 =09inode_inc_iversion(dir);
-=09dir->i_mtime =3D dir->i_atime =3D current_time(dir);
+=09dir->i_mtime =3D dir->i_atime =3D dir->i_ctime =3D current_time(dir);
 =09exfat_truncate_atime(&dir->i_atime);
 =09if (IS_DIRSYNC(dir))
 =09=09exfat_sync_inode(dir);
@@ -825,7 +825,7 @@ static int exfat_unlink(struct inode *dir, struct dentr=
y *dentry)
 =09=09mark_inode_dirty(dir);
=20
 =09clear_nlink(inode);
-=09inode->i_mtime =3D inode->i_atime =3D current_time(inode);
+=09inode->i_mtime =3D inode->i_atime =3D inode->i_ctime =3D current_time(i=
node);
 =09exfat_truncate_atime(&inode->i_atime);
 =09exfat_unhash_inode(inode);
 =09exfat_d_version_set(dentry, inode_query_iversion(dir));
@@ -979,7 +979,7 @@ static int exfat_rmdir(struct inode *dir, struct dentry=
 *dentry)
 =09ei->dir.dir =3D DIR_DELETED;
=20
 =09inode_inc_iversion(dir);
-=09dir->i_mtime =3D dir->i_atime =3D current_time(dir);
+=09dir->i_mtime =3D dir->i_atime =3D dir->i_ctime =3D current_time(dir);
 =09exfat_truncate_atime(&dir->i_atime);
 =09if (IS_DIRSYNC(dir))
 =09=09exfat_sync_inode(dir);
@@ -988,7 +988,7 @@ static int exfat_rmdir(struct inode *dir, struct dentry=
 *dentry)
 =09drop_nlink(dir);
=20
 =09clear_nlink(inode);
-=09inode->i_mtime =3D inode->i_atime =3D current_time(inode);
+=09inode->i_mtime =3D inode->i_atime =3D inode->i_ctime =3D current_time(i=
node);
 =09exfat_truncate_atime(&inode->i_atime);
 =09exfat_unhash_inode(inode);
 =09exfat_d_version_set(dentry, inode_query_iversion(dir));
--=20
2.40.1

