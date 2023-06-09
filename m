Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A41BC729AD1
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Jun 2023 14:57:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686315441;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XnbpbZVHrnrqpV4IJTSFvMvMIjGJt/Z1k+ZqLudQFxg=;
	b=MrSzBXrz+7st+/9oFqOl4zfz4LB0FZZmTIjEDYeBmXyy+qqOmWBrChzeYrZh2angGEzw98
	DhFEb71/f+EdYNlJVRhOckEX1MHdTfKQI8BxrTwUUtlBXDngbuUgfdS7AwTAcH+83ycAP5
	jfMNsKZVWf7yG7q3mUswJYCtNVCr9AY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-dYNXBEMQN0CJa0m07_B-ng-1; Fri, 09 Jun 2023 08:57:18 -0400
X-MC-Unique: dYNXBEMQN0CJa0m07_B-ng-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B507C803492;
	Fri,  9 Jun 2023 12:57:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F97E492B0B;
	Fri,  9 Jun 2023 12:57:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8258819451DD;
	Fri,  9 Jun 2023 12:57:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0B86919451C5 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  9 Jun 2023 12:57:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 20D25C15612; Fri,  9 Jun 2023 12:57:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18AC4C16047
 for <cluster-devel@redhat.com>; Fri,  9 Jun 2023 12:57:04 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE15E100F64F
 for <cluster-devel@redhat.com>; Fri,  9 Jun 2023 12:57:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-LS-3C4NjNzWr0Jmx_tB1cA-1; Fri, 09 Jun 2023 08:57:02 -0400
X-MC-Unique: LS-3C4NjNzWr0Jmx_tB1cA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 387FD61DDC;
 Fri,  9 Jun 2023 12:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95034C433D2;
 Fri,  9 Jun 2023 12:50:51 +0000 (UTC)
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
Date: Fri,  9 Jun 2023 08:50:22 -0400
Message-Id: <20230609125023.399942-9-jlayton@kernel.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH 8/9] apparmor: update ctime whenever the
 mtime changes on an inode
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 security/apparmor/apparmorfs.c    |  7 +++++--
 security/apparmor/policy_unpack.c | 11 +++++++----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.=
c
index db7a51acf9db..c06053718836 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -1554,8 +1554,11 @@ void __aafs_profile_migrate_dents(struct aa_profile =
*old,
=20
 =09for (i =3D 0; i < AAFS_PROF_SIZEOF; i++) {
 =09=09new->dents[i] =3D old->dents[i];
-=09=09if (new->dents[i])
-=09=09=09new->dents[i]->d_inode->i_mtime =3D current_time(new->dents[i]->d=
_inode);
+=09=09if (new->dents[i]) {
+=09=09=09struct inode *inode =3D d_inode(new->dents[i]);
+
+=09=09=09inode->i_mtime =3D inode->i_ctime =3D current_time(inode);
+=09=09}
 =09=09old->dents[i] =3D NULL;
 =09}
 }
diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_u=
npack.c
index cf2ceec40b28..48a97c1800b9 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -86,10 +86,13 @@ void __aa_loaddata_update(struct aa_loaddata *data, lon=
g revision)
=20
 =09data->revision =3D revision;
 =09if ((data->dents[AAFS_LOADDATA_REVISION])) {
-=09=09d_inode(data->dents[AAFS_LOADDATA_DIR])->i_mtime =3D
-=09=09=09current_time(d_inode(data->dents[AAFS_LOADDATA_DIR]));
-=09=09d_inode(data->dents[AAFS_LOADDATA_REVISION])->i_mtime =3D
-=09=09=09current_time(d_inode(data->dents[AAFS_LOADDATA_REVISION]));
+=09=09struct inode *inode;
+
+=09=09inode =3D d_inode(data->dents[AAFS_LOADDATA_DIR]);
+=09=09inode->i_mtime =3D inode->i_ctime =3D current_time(inode);
+
+=09=09inode =3D d_inode(data->dents[AAFS_LOADDATA_REVISION]);
+=09=09inode->i_mtime =3D inode->i_ctime =3D current_time(inode);
 =09}
 }
=20
--=20
2.40.1

