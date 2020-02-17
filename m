Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D6895161810
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Feb 2020 17:36:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581957383;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1cX/x3ZXMTrWMPP/DcTfNohSY+K7u1Uz6Gp0LQ7j7ZE=;
	b=UbI0hRm2SVx3IosNFM8EFQ93XqCbBLYLbMW1dQoY+rxihDQPG9T4AMyxr9RK9Z1BMrC4eO
	LbMpjcRBdD/3ZT+A5r0UujeL/eFoM40r/jWSVh3Y5+VYA9h18ujpwoKJrHeWuUv+WYxV4s
	S4iW0wAY2pKDfX2rgIjWDDEj7Uc5TlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-hGlynDZaNA6tm1at2mXNDQ-1; Mon, 17 Feb 2020 11:36:22 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33B288010F6;
	Mon, 17 Feb 2020 16:36:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 826A55C219;
	Mon, 17 Feb 2020 16:36:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8CE6235B01;
	Mon, 17 Feb 2020 16:36:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HGVNS8016200 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 11:31:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6B9E010DCF44; Mon, 17 Feb 2020 16:31:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6746210DCF43
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 16:31:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E114F80020B
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 16:31:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-326-rY2UObQ8OUqGenvXi6GYqw-1; Mon, 17 Feb 2020 11:31:17 -0500
Received: from tmo-109-126.customers.d1-online.com ([80.187.109.126]
	helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3j0c-0006ui-CL; Mon, 17 Feb 2020 16:12:34 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
	(envelope-from <mchehab@bombadil.infradead.org>)
	id 1j3j0a-000faX-Dy; Mon, 17 Feb 2020 17:12:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Mon, 17 Feb 2020 17:12:06 +0100
Message-Id: <1d1c46b7e86bd0a18d9abbea0de0bc2be84e5e2b.1581955849.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1581955849.git.mchehab+huawei@kernel.org>
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-MC-Unique: rY2UObQ8OUqGenvXi6GYqw-1
X-MC-Unique: hGlynDZaNA6tm1at2mXNDQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HGVNS8016200
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 17 Feb 2020 11:36:11 -0500
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 20/44] docs: filesystems: convert
	gfs2-uevents.txt to ReST
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This document is almost in ReST format: all it needs is to have
the titles adjusted and add a SPDX header. In other words:

- Add a SPDX header;
- Add a document title;
- Adjust section titles;
- Add it to filesystems/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../{gfs2-uevents.txt =3D> gfs2-uevents.rst}    | 20 +++++++++++++++----
 Documentation/filesystems/index.rst           |  1 +
 2 files changed, 17 insertions(+), 4 deletions(-)
 rename Documentation/filesystems/{gfs2-uevents.txt =3D> gfs2-uevents.rst} =
(94%)

diff --git a/Documentation/filesystems/gfs2-uevents.txt b/Documentation/fil=
esystems/gfs2-uevents.rst
similarity index 94%
rename from Documentation/filesystems/gfs2-uevents.txt
rename to Documentation/filesystems/gfs2-uevents.rst
index 19a19ebebc34..f162a2c76c69 100644
--- a/Documentation/filesystems/gfs2-uevents.txt
+++ b/Documentation/filesystems/gfs2-uevents.rst
@@ -1,14 +1,18 @@
-                              uevents and GFS2
-                             =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+.. SPDX-License-Identifier: GPL-2.0
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+uevents and GFS2
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 During the lifetime of a GFS2 mount, a number of uevents are generated.
 This document explains what the events are and what they are used
 for (by gfs_controld in gfs2-utils).
=20
 A list of GFS2 uevents
------------------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 1. ADD
+------
=20
 The ADD event occurs at mount time. It will always be the first
 uevent generated by the newly created filesystem. If the mount
@@ -21,6 +25,7 @@ with no journal assigned), and read-only (with journal as=
signed) status
 of the filesystem respectively.
=20
 2. ONLINE
+---------
=20
 The ONLINE uevent is generated after a successful mount or remount. It
 has the same environment variables as the ADD uevent. The ONLINE
@@ -29,6 +34,7 @@ RDONLY are a relatively recent addition (2.6.32-rc+) and =
will not
 be generated by older kernels.
=20
 3. CHANGE
+---------
=20
 The CHANGE uevent is used in two places. One is when reporting the
 successful mount of the filesystem by the first node (FIRSTMOUNT=3DDone).
@@ -52,6 +58,7 @@ cluster. For this reason the ONLINE uevent was used when =
adding a new
 uevent for a successful mount or remount.
=20
 4. OFFLINE
+----------
=20
 The OFFLINE uevent is only generated due to filesystem errors and is used
 as part of the "withdraw" mechanism. Currently this doesn't give any
@@ -59,6 +66,7 @@ information about what the error is, which is something t=
hat needs to
 be fixed.
=20
 5. REMOVE
+---------
=20
 The REMOVE uevent is generated at the end of an unsuccessful mount
 or at the end of a umount of the filesystem. All REMOVE uevents will
@@ -68,9 +76,10 @@ kobject subsystem.
=20
=20
 Information common to all GFS2 uevents (uevent environment variables)
-----------------------------------------------------------------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 1. LOCKTABLE=3D
+--------------
=20
 The LOCKTABLE is a string, as supplied on the mount command
 line (locktable=3D) or via fstab. It is used as a filesystem label
@@ -78,6 +87,7 @@ as well as providing the information for a lock_dlm mount=
 to be
 able to join the cluster.
=20
 2. LOCKPROTO=3D
+-------------
=20
 The LOCKPROTO is a string, and its value depends on what is set
 on the mount command line, or via fstab. It will be either
@@ -85,12 +95,14 @@ lock_nolock or lock_dlm. In the future other lock manag=
ers
 may be supported.
=20
 3. JOURNALID=3D
+-------------
=20
 If a journal is in use by the filesystem (journals are not
 assigned for spectator mounts) then this will give the
 numeric journal id in all GFS2 uevents.
=20
 4. UUID=3D
+--------
=20
 With recent versions of gfs2-utils, mkfs.gfs2 writes a UUID
 into the filesystem superblock. If it exists, this will
diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystem=
s/index.rst
index f24befe78326..c16e517e37c5 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -66,6 +66,7 @@ Documentation for filesystem implementations.
    ext3
    f2fs
    gfs2
+   gfs2-uevents
    fuse
    overlayfs
    virtiofs
--=20
2.24.1


