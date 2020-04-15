Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB4C1AA9FE
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Apr 2020 16:33:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586961198;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HR057J/GySUS3vQbYKfxFhtDaqQn0YYRuOcff3VnDEQ=;
	b=bY5XFg6sT8XmyGBwTpTnlXBQEt/lx21aLzk7GA19TANpGbO/1PeovAoQfzsPr28goIh8Pk
	AU01K+kKXKetDZrRz56jzLwp9xVGvSwtRFjH2+N5F19TBNM8ntI5PJ3p42n5VD7QwhFU/8
	PS0n4Y/3Af/zuAeYVdfsSxhvCZ6U5mk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-G2IRgBiENxqEGtSBoY7aSw-1; Wed, 15 Apr 2020 10:33:11 -0400
X-MC-Unique: G2IRgBiENxqEGtSBoY7aSw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A9362F2A;
	Wed, 15 Apr 2020 14:33:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C19E0116D9E;
	Wed, 15 Apr 2020 14:33:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B6B918089D0;
	Wed, 15 Apr 2020 14:33:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03FEX1Uw006307 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 10:33:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4480A11233D; Wed, 15 Apr 2020 14:33:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40482113F72
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 14:32:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1773A800A15
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 14:32:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-153-CipkEKG0MAudpsqeoyCN5Q-1;
	Wed, 15 Apr 2020 10:32:55 -0400
X-MC-Unique: CipkEKG0MAudpsqeoyCN5Q-1
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de
	[95.90.212.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5DA3521927;
	Wed, 15 Apr 2020 14:32:51 +0000 (UTC)
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
	(envelope-from <mchehab@kernel.org>)
	id 1jOj5t-006kP7-Kn; Wed, 15 Apr 2020 16:32:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Wed, 15 Apr 2020 16:32:31 +0200
Message-Id: <e146506222bf13e8ef7008ac8b4547172c2faad8.1586960617.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1586960617.git.mchehab+huawei@kernel.org>
References: <cover.1586960617.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03FEX1Uw006307
X-loop: cluster-devel@redhat.com
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 18/34] docs: filesystems: convert
	gfs2-glocks.txt to ReST
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

- Add a SPDX header;
- Adjust document and section titles;
- Some whitespace fixes and new line breaks;
- Add table markups;
- Use notes markups;
- Add it to filesystems/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../{gfs2-glocks.txt =3D> gfs2-glocks.rst}      | 147 ++++++++++--------
 Documentation/filesystems/index.rst           |   1 +
 MAINTAINERS                                   |   2 +-
 3 files changed, 86 insertions(+), 64 deletions(-)
 rename Documentation/filesystems/{gfs2-glocks.txt =3D> gfs2-glocks.rst} (6=
3%)

diff --git a/Documentation/filesystems/gfs2-glocks.txt b/Documentation/file=
systems/gfs2-glocks.rst
similarity index 63%
rename from Documentation/filesystems/gfs2-glocks.txt
rename to Documentation/filesystems/gfs2-glocks.rst
index 7059623635b2..d14f230f0b12 100644
--- a/Documentation/filesystems/gfs2-glocks.txt
+++ b/Documentation/filesystems/gfs2-glocks.rst
@@ -1,5 +1,8 @@
-                   Glock internal locking rules
-                  ------------------------------
+.. SPDX-License-Identifier: GPL-2.0
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+Glock internal locking rules
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
=20
 This documents the basic principles of the glock state machine
 internals. Each glock (struct gfs2_glock in fs/gfs2/incore.h)
@@ -24,24 +27,28 @@ There are three lock states that users of the glock lay=
er can request,
 namely shared (SH), deferred (DF) and exclusive (EX). Those translate
 to the following DLM lock modes:
=20
-Glock mode    | DLM lock mode
-------------------------------
-    UN        |    IV/NL  Unlocked (no DLM lock associated with glock) or =
NL
-    SH        |    PR     (Protected read)
-    DF        |    CW     (Concurrent write)
-    EX        |    EX     (Exclusive)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=09=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Glock mode      DLM    lock mode
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=09=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+    UN          IV/NL  Unlocked (no DLM lock associated with glock) or NL
+    SH          PR     (Protected read)
+    DF          CW     (Concurrent write)
+    EX          EX     (Exclusive)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=09=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Thus DF is basically a shared mode which is incompatible with the "normal"
 shared lock mode, SH. In GFS2 the DF mode is used exclusively for direct I=
/O
 operations. The glocks are basically a lock plus some routines which deal
 with cache management. The following rules apply for the cache:
=20
-Glock mode   |  Cache data | Cache Metadata | Dirty Data | Dirty Metadata
---------------------------------------------------------------------------
-    UN       |     No      |       No       |     No     |      No
-    SH       |     Yes     |       Yes      |     No     |      No
-    DF       |     No      |       Yes      |     No     |      No
-    EX       |     Yes     |       Yes      |     Yes    |      Yes
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Glock mode      Cache data   Cache Metadata   Dirty Data   Dirty Metadata
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+    UN             No              No             No            No
+    SH             Yes             Yes            No            No
+    DF             No              Yes            No            No
+    EX             Yes             Yes            Yes           Yes
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 These rules are implemented using the various glock operations which
 are defined for each type of glock. Not all types of glocks use
@@ -49,21 +56,23 @@ all the modes. Only inode glocks use the DF mode for ex=
ample.
=20
 Table of glock operations and per type constants:
=20
-Field            | Purpose
---------------------------------------------------------------------------=
--
-go_xmote_th      | Called before remote state change (e.g. to sync dirty d=
ata)
-go_xmote_bh      | Called after remote state change (e.g. to refill cache)
-go_inval         | Called if remote state change requires invalidating the=
 cache
-go_demote_ok     | Returns boolean value of whether its ok to demote a glo=
ck
-                 | (e.g. checks timeout, and that there is no cached data)
-go_lock          | Called for the first local holder of a lock
-go_unlock        | Called on the final local unlock of a lock
-go_dump          | Called to print content of object for debugfs file, or =
on
-                 | error to dump glock to the log.
-go_type          | The type of the glock, LM_TYPE_.....
-go_callback=09 | Called if the DLM sends a callback to drop this lock
-go_flags=09 | GLOF_ASPACE is set, if the glock has an address space
-                 | associated with it
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D      =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+Field              Purpose
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D      =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+go_xmote_th        Called before remote state change (e.g. to sync dirty d=
ata)
+go_xmote_bh        Called after remote state change (e.g. to refill cache)
+go_inval           Called if remote state change requires invalidating the=
 cache
+go_demote_ok       Returns boolean value of whether its ok to demote a glo=
ck
+                   (e.g. checks timeout, and that there is no cached data)
+go_lock            Called for the first local holder of a lock
+go_unlock          Called on the final local unlock of a lock
+go_dump            Called to print content of object for debugfs file, or =
on
+                   error to dump glock to the log.
+go_type            The type of the glock, ``LM_TYPE_*``
+go_callback=09   Called if the DLM sends a callback to drop this lock
+go_flags=09   GLOF_ASPACE is set, if the glock has an address space
+                   associated with it
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D      =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
=20
 The minimum hold time for each lock is the time after a remote lock
 grant for which we ignore remote demote requests. This is in order to
@@ -82,21 +91,25 @@ rather than via the glock.
=20
 Locking rules for glock operations:
=20
-Operation     |  GLF_LOCK bit lock held |  gl_lockref.lock spinlock held
--------------------------------------------------------------------------
-go_xmote_th   |       Yes               |       No
-go_xmote_bh   |       Yes               |       No
-go_inval      |       Yes               |       No
-go_demote_ok  |       Sometimes         |       Yes
-go_lock       |       Yes               |       No
-go_unlock     |       Yes               |       No
-go_dump       |       Sometimes         |       Yes
-go_callback   |       Sometimes (N/A)   |       Yes
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Operation        GLF_LOCK bit lock held    gl_lockref.lock spinlock held
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+go_xmote_th           Yes                       No
+go_xmote_bh           Yes                       No
+go_inval              Yes                       No
+go_demote_ok          Sometimes                 Yes
+go_lock               Yes                       No
+go_unlock             Yes                       No
+go_dump               Sometimes                 Yes
+go_callback           Sometimes (N/A)           Yes
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-N.B. Operations must not drop either the bit lock or the spinlock
-if its held on entry. go_dump and do_demote_ok must never block.
-Note that go_dump will only be called if the glock's state
-indicates that it is caching uptodate data.
+.. Note::
+
+   Operations must not drop either the bit lock or the spinlock
+   if its held on entry. go_dump and do_demote_ok must never block.
+   Note that go_dump will only be called if the glock's state
+   indicates that it is caching uptodate data.
=20
 Glock locking order within GFS2:
=20
@@ -104,7 +117,7 @@ Glock locking order within GFS2:
  2. Rename glock (for rename only)
  3. Inode glock(s)
     (Parents before children, inodes at "same level" with same parent in
-     lock number order)
+    lock number order)
  4. Rgrp glock(s) (for (de)allocation operations)
  5. Transaction glock (via gfs2_trans_begin) for non-read operations
  6. i_rw_mutex (if required)
@@ -117,8 +130,8 @@ determine the lifetime of the inode in question. Lockin=
g of inodes
 is on a per-inode basis. Locking of rgrps is on a per rgrp basis.
 In general we prefer to lock local locks prior to cluster locks.
=20
-                            Glock Statistics
-                           ------------------
+Glock Statistics
+----------------
=20
 The stats are divided into two sets: those relating to the
 super block and those relating to an individual glock. The
@@ -173,8 +186,8 @@ we'd like to get a better idea of these timings:
 1. To be able to better set the glock "min hold time"
 2. To spot performance issues more easily
 3. To improve the algorithm for selecting resource groups for
-allocation (to base it on lock wait time, rather than blindly
-using a "try lock")
+   allocation (to base it on lock wait time, rather than blindly
+   using a "try lock")
=20
 Due to the smoothing action of the updates, a step change in
 some input quantity being sampled will only fully be taken
@@ -195,10 +208,13 @@ as possible. There are always inaccuracies in any
 measuring system, but I hope this is as accurate as we
 can reasonably make it.
=20
-Per sb stats can be found here:
-/sys/kernel/debug/gfs2/<fsname>/sbstats
-Per glock stats can be found here:
-/sys/kernel/debug/gfs2/<fsname>/glstats
+Per sb stats can be found here::
+
+    /sys/kernel/debug/gfs2/<fsname>/sbstats
+
+Per glock stats can be found here::
+
+    /sys/kernel/debug/gfs2/<fsname>/glstats
=20
 Assuming that debugfs is mounted on /sys/kernel/debug and also
 that <fsname> is replaced with the name of the gfs2 filesystem
@@ -206,14 +222,16 @@ in question.
=20
 The abbreviations used in the output as are follows:
=20
-srtt     - Smoothed round trip time for non-blocking dlm requests
-srttvar  - Variance estimate for srtt
-srttb    - Smoothed round trip time for (potentially) blocking dlm request=
s
-srttvarb - Variance estimate for srttb
-sirt     - Smoothed inter-request time (for dlm requests)
-sirtvar  - Variance estimate for sirt
-dlm      - Number of dlm requests made (dcnt in glstats file)
-queue    - Number of glock requests queued (qcnt in glstats file)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+srtt       Smoothed round trip time for non blocking dlm requests
+srttvar    Variance estimate for srtt
+srttb      Smoothed round trip time for (potentially) blocking dlm request=
s
+srttvarb   Variance estimate for srttb
+sirt       Smoothed inter request time (for dlm requests)
+sirtvar    Variance estimate for sirt
+dlm        Number of dlm requests made (dcnt in glstats file)
+queue      Number of glock requests queued (qcnt in glstats file)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 The sbstats file contains a set of these stats for each glock type (so 8 l=
ines
 for each type) and for each cpu (one column per cpu). The glstats file con=
tains
@@ -224,9 +242,12 @@ The gfs2_glock_lock_time tracepoint prints out the cur=
rent values of the stats
 for the glock in question, along with some addition information on each dl=
m
 reply that is received:
=20
-status - The status of the dlm request
-flags  - The dlm request flags
-tdiff  - The time taken by this specific request
+=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+status   The status of the dlm request
+flags    The dlm request flags
+tdiff    The time taken by this specific request
+=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
 (remaining fields as per above list)
=20
=20
diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystem=
s/index.rst
index 300e12569f54..6a34d1b578a9 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -81,6 +81,7 @@ Documentation for filesystem implementations.
    f2fs
    gfs2
    gfs2-uevents
+   gfs2-glocks
    hfs
    hfsplus
    hpfs
diff --git a/MAINTAINERS b/MAINTAINERS
index eebb55517709..470389ef0135 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7181,7 +7181,7 @@ L:=09cluster-devel@redhat.com
 S:=09Supported
 W:=09http://sources.redhat.com/cluster/
 T:=09git git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
-F:=09Documentation/filesystems/gfs2*.txt
+F:=09Documentation/filesystems/gfs2*
 F:=09fs/gfs2/
 F:=09include/uapi/linux/gfs2_ondisk.h
=20
--=20
2.25.2


