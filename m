Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38882729AD4
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Jun 2023 14:57:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686315449;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RMfYirGV04wyfd1Elkyy40f3x3A3v2feY+QVcnEzoLY=;
	b=Qopn0tla5cv/et6g2EUnq29j9Fx5ggoIFBTKckVlnscv1UncpbhibDOl/gE5pguzz9oCoW
	u8ZV2tEC/l1Fd045rWJy/hz3qNMlXMM1MiZ0xNlf/yuSLjHgRFD1EOcSsxTAk19zWehD4J
	GHPaU9A/Em4lPOAFmE3I2Bw5HQ9d55E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-_J8gHYrzMPWXZg8dipObuw-1; Fri, 09 Jun 2023 08:57:19 -0400
X-MC-Unique: _J8gHYrzMPWXZg8dipObuw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB16A29DD997;
	Fri,  9 Jun 2023 12:57:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E021A492B0A;
	Fri,  9 Jun 2023 12:57:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 433E319451D2;
	Fri,  9 Jun 2023 12:57:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0D84119451CA for <cluster-devel@listman.corp.redhat.com>;
 Fri,  9 Jun 2023 12:57:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A88D3140E956; Fri,  9 Jun 2023 12:57:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1910140E954
 for <cluster-devel@redhat.com>; Fri,  9 Jun 2023 12:57:04 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 741FC811E94
 for <cluster-devel@redhat.com>; Fri,  9 Jun 2023 12:57:04 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-uUzotyIhNlWNzAii0tzPbg-1; Fri, 09 Jun 2023 08:57:01 -0400
X-MC-Unique: uUzotyIhNlWNzAii0tzPbg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 423E664CFD;
 Fri,  9 Jun 2023 12:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EB0C433A0;
 Fri,  9 Jun 2023 12:50:31 +0000 (UTC)
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
Date: Fri,  9 Jun 2023 08:50:16 -0400
Message-Id: <20230609125023.399942-3-jlayton@kernel.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH 2/9] usb: update the ctime as well when
 updating mtime after an ioctl
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
 drivers/usb/core/devio.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index fcf68818e999..1268d313a8df 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -2640,21 +2640,21 @@ static long usbdev_do_ioctl(struct file *file, unsi=
gned int cmd,
 =09=09snoop(&dev->dev, "%s: CONTROL\n", __func__);
 =09=09ret =3D proc_control(ps, p);
 =09=09if (ret >=3D 0)
-=09=09=09inode->i_mtime =3D current_time(inode);
+=09=09=09inode->i_mtime =3D inode->i_ctime =3D current_time(inode);
 =09=09break;
=20
 =09case USBDEVFS_BULK:
 =09=09snoop(&dev->dev, "%s: BULK\n", __func__);
 =09=09ret =3D proc_bulk(ps, p);
 =09=09if (ret >=3D 0)
-=09=09=09inode->i_mtime =3D current_time(inode);
+=09=09=09inode->i_mtime =3D inode->i_ctime =3D current_time(inode);
 =09=09break;
=20
 =09case USBDEVFS_RESETEP:
 =09=09snoop(&dev->dev, "%s: RESETEP\n", __func__);
 =09=09ret =3D proc_resetep(ps, p);
 =09=09if (ret >=3D 0)
-=09=09=09inode->i_mtime =3D current_time(inode);
+=09=09=09inode->i_mtime =3D inode->i_ctime =3D current_time(inode);
 =09=09break;
=20
 =09case USBDEVFS_RESET:
@@ -2666,7 +2666,7 @@ static long usbdev_do_ioctl(struct file *file, unsign=
ed int cmd,
 =09=09snoop(&dev->dev, "%s: CLEAR_HALT\n", __func__);
 =09=09ret =3D proc_clearhalt(ps, p);
 =09=09if (ret >=3D 0)
-=09=09=09inode->i_mtime =3D current_time(inode);
+=09=09=09inode->i_mtime =3D inode->i_ctime =3D current_time(inode);
 =09=09break;
=20
 =09case USBDEVFS_GETDRIVER:
@@ -2693,7 +2693,7 @@ static long usbdev_do_ioctl(struct file *file, unsign=
ed int cmd,
 =09=09snoop(&dev->dev, "%s: SUBMITURB\n", __func__);
 =09=09ret =3D proc_submiturb(ps, p);
 =09=09if (ret >=3D 0)
-=09=09=09inode->i_mtime =3D current_time(inode);
+=09=09=09inode->i_mtime =3D inode->i_ctime =3D current_time(inode);
 =09=09break;
=20
 #ifdef CONFIG_COMPAT
@@ -2701,14 +2701,14 @@ static long usbdev_do_ioctl(struct file *file, unsi=
gned int cmd,
 =09=09snoop(&dev->dev, "%s: CONTROL32\n", __func__);
 =09=09ret =3D proc_control_compat(ps, p);
 =09=09if (ret >=3D 0)
-=09=09=09inode->i_mtime =3D current_time(inode);
+=09=09=09inode->i_mtime =3D inode->i_ctime =3D current_time(inode);
 =09=09break;
=20
 =09case USBDEVFS_BULK32:
 =09=09snoop(&dev->dev, "%s: BULK32\n", __func__);
 =09=09ret =3D proc_bulk_compat(ps, p);
 =09=09if (ret >=3D 0)
-=09=09=09inode->i_mtime =3D current_time(inode);
+=09=09=09inode->i_mtime =3D inode->i_ctime =3D current_time(inode);
 =09=09break;
=20
 =09case USBDEVFS_DISCSIGNAL32:
@@ -2720,7 +2720,7 @@ static long usbdev_do_ioctl(struct file *file, unsign=
ed int cmd,
 =09=09snoop(&dev->dev, "%s: SUBMITURB32\n", __func__);
 =09=09ret =3D proc_submiturb_compat(ps, p);
 =09=09if (ret >=3D 0)
-=09=09=09inode->i_mtime =3D current_time(inode);
+=09=09=09inode->i_mtime =3D inode->i_ctime =3D current_time(inode);
 =09=09break;
=20
 =09case USBDEVFS_IOCTL32:
--=20
2.40.1

