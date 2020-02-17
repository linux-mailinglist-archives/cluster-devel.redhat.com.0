Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CAB91161812
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Feb 2020 17:36:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581957384;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=f1Fhpx140D4yNjHg2gfrLx2nEBPcIWUuqblQZK393xM=;
	b=OMp3rgRhyo899xRdTTu4PzDBZEY0Kfjhgpj4KCsc1HbBd7gMHQKWog9jUVy5QlsJflTjcx
	kvrebvb0kO4caUwXi8ek5v4byJgcdHHhjN6DMkmXh1Nchh0siCUDbVP1CnS2r/6IAMKmd0
	6Y3oL0X65FB6E5k/WYC+UhWBjeFPcrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-rLA5_ZjPNGm-jgQcttxUGQ-1; Mon, 17 Feb 2020 11:36:22 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97655107ACC5;
	Mon, 17 Feb 2020 16:36:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D10360BE1;
	Mon, 17 Feb 2020 16:36:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2934A1832DEA;
	Mon, 17 Feb 2020 16:36:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HGVNkr016199 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 11:31:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 51D6FD0B3D; Mon, 17 Feb 2020 16:31:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DBD5D0B59
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 16:31:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2404802FF3
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 16:31:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-225-j5MA-VcsOD6iFY4vm11l4Q-1; Mon, 17 Feb 2020 11:31:18 -0500
Received: from tmo-109-126.customers.d1-online.com ([80.187.109.126]
	helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3j0c-0006uh-9f; Mon, 17 Feb 2020 16:12:34 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
	(envelope-from <mchehab@bombadil.infradead.org>)
	id 1j3j0a-000faS-CM; Mon, 17 Feb 2020 17:12:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Mon, 17 Feb 2020 17:12:05 +0100
Message-Id: <6d7a296de025bcfed7a229da7f8cc1678944f304.1581955849.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1581955849.git.mchehab+huawei@kernel.org>
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-MC-Unique: j5MA-VcsOD6iFY4vm11l4Q-1
X-MC-Unique: rLA5_ZjPNGm-jgQcttxUGQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HGVNkr016199
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 17 Feb 2020 11:36:11 -0500
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 19/44] docs: filesystems: convert gfs2.txt
	to ReST
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

- Add a SPDX header;
- Adjust document title;
- Some whitespace fixes and new line breaks;
- Mark literal blocks as such;
- Add table markups;
- Add it to filesystems/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../filesystems/{gfs2.txt =3D> gfs2.rst}        | 20 +++++++++++++------
 Documentation/filesystems/index.rst           |  1 +
 2 files changed, 15 insertions(+), 6 deletions(-)
 rename Documentation/filesystems/{gfs2.txt =3D> gfs2.rst} (76%)

diff --git a/Documentation/filesystems/gfs2.txt b/Documentation/filesystems=
/gfs2.rst
similarity index 76%
rename from Documentation/filesystems/gfs2.txt
rename to Documentation/filesystems/gfs2.rst
index cc4f2306609e..8d1ab589ce18 100644
--- a/Documentation/filesystems/gfs2.txt
+++ b/Documentation/filesystems/gfs2.rst
@@ -1,5 +1,8 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 Global File System
-------------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 https://fedorahosted.org/cluster/wiki/HomePage
=20
@@ -14,16 +17,18 @@ on one machine show up immediately on all other machine=
s in the cluster.
 GFS uses interchangeable inter-node locking mechanisms, the currently
 supported mechanisms are:
=20
-  lock_nolock -- allows gfs to be used as a local file system
+  lock_nolock
+    - allows gfs to be used as a local file system
=20
-  lock_dlm -- uses a distributed lock manager (dlm) for inter-node locking
-  The dlm is found at linux/fs/dlm/
+  lock_dlm
+    - uses a distributed lock manager (dlm) for inter-node locking.
+      The dlm is found at linux/fs/dlm/
=20
 Lock_dlm depends on user space cluster management systems found
 at the URL above.
=20
 To use gfs as a local file system, no external clustering systems are
-needed, simply:
+needed, simply::
=20
   $ mkfs -t gfs2 -p lock_nolock -j 1 /dev/block_device
   $ mount -t gfs2 /dev/block_device /dir
@@ -37,9 +42,12 @@ GFS2 is not on-disk compatible with previous versions of=
 GFS, but it
 is pretty close.
=20
 The following man pages can be found at the URL above:
+
+  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=09=09=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   fsck.gfs2=09=09to repair a filesystem
   gfs2_grow=09=09to expand a filesystem online
   gfs2_jadd=09=09to add journals to a filesystem online
   tunegfs2=09=09to manipulate, examine and tune a filesystem
-  gfs2_convert=09to convert a gfs filesystem to gfs2 in-place
+  gfs2_convert=09=09to convert a gfs filesystem to gfs2 in-place
   mkfs.gfs2=09=09to make a filesystem
+  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=09=09=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystem=
s/index.rst
index f69d20406be0..f24befe78326 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -65,6 +65,7 @@ Documentation for filesystem implementations.
    ext2
    ext3
    f2fs
+   gfs2
    fuse
    overlayfs
    virtiofs
--=20
2.24.1


