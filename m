Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 649A71F1C91
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 18:00:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591632058;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Y1srLQjIxgH4hvcCW22TkpGJIUfS4hZgAl8oKJMD0SU=;
	b=eoPQ3dBPxQVeF7ZLs0NtF5IqJI53uQAKY2ba5k0KQ++d/vTXJzNaEJRKIG7AKcdYKwASar
	sIWI91RlVg+1XCZ8rU7kjtkNXS6Xg7DK0W6a4OclC6wT/ebZyWedtovC4+vgqOBMbHW2tG
	eC+YKtOnDXesvFSMTcHIAoRH8NiRtd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-2fMLYoJuOs-jz7cIiR-qbg-1; Mon, 08 Jun 2020 12:00:56 -0400
X-MC-Unique: 2fMLYoJuOs-jz7cIiR-qbg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B9DE8015CE;
	Mon,  8 Jun 2020 16:00:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 780657B5F8;
	Mon,  8 Jun 2020 16:00:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C69B1809547;
	Mon,  8 Jun 2020 16:00:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058G0kQZ011598 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:00:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2E64B1CA; Mon,  8 Jun 2020 16:00:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0148C648DB;
	Mon,  8 Jun 2020 16:00:44 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  8 Jun 2020 18:00:20 +0200
Message-Id: <20200608160039.549204-2-agruenba@redhat.com>
In-Reply-To: <20200608160039.549204-1-agruenba@redhat.com>
References: <20200608160039.549204-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [Cluster-devel] [PATCH 01/20] docs: filesystems: convert
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

- Add a SPDX header;
- Adjust document and section titles;
- Some whitespace fixes and new line breaks;
- Add table markups;
- Use notes markups;
- Add it to filesystems/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 .../{gfs2-glocks.txt => gfs2-glocks.rst}      | 149 ++++++++++--------
 Documentation/filesystems/index.rst           |   1 +
 MAINTAINERS                                   |   2 +-
 3 files changed, 87 insertions(+), 65 deletions(-)
 rename Documentation/filesystems/{gfs2-glocks.txt => gfs2-glocks.rst} (63%)

diff --git a/Documentation/filesystems/gfs2-glocks.txt b/Documentation/filesystems/gfs2-glocks.rst
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
+============================
+Glock internal locking rules
+============================
 
 This documents the basic principles of the glock state machine
 internals. Each glock (struct gfs2_glock in fs/gfs2/incore.h)
@@ -24,24 +27,28 @@ There are three lock states that users of the glock layer can request,
 namely shared (SH), deferred (DF) and exclusive (EX). Those translate
 to the following DLM lock modes:
 
-Glock mode    | DLM lock mode
-------------------------------
-    UN        |    IV/NL  Unlocked (no DLM lock associated with glock) or NL
-    SH        |    PR     (Protected read)
-    DF        |    CW     (Concurrent write)
-    EX        |    EX     (Exclusive)
+==========	====== =====================================================
+Glock mode      DLM    lock mode
+==========	====== =====================================================
+    UN          IV/NL  Unlocked (no DLM lock associated with glock) or NL
+    SH          PR     (Protected read)
+    DF          CW     (Concurrent write)
+    EX          EX     (Exclusive)
+==========	====== =====================================================
 
 Thus DF is basically a shared mode which is incompatible with the "normal"
 shared lock mode, SH. In GFS2 the DF mode is used exclusively for direct I/O
 operations. The glocks are basically a lock plus some routines which deal
 with cache management. The following rules apply for the cache:
 
-Glock mode   |  Cache data | Cache Metadata | Dirty Data | Dirty Metadata
---------------------------------------------------------------------------
-    UN       |     No      |       No       |     No     |      No
-    SH       |     Yes     |       Yes      |     No     |      No
-    DF       |     No      |       Yes      |     No     |      No
-    EX       |     Yes     |       Yes      |     Yes    |      Yes
+==========      ==========   ==============   ==========   ==============
+Glock mode      Cache data   Cache Metadata   Dirty Data   Dirty Metadata
+==========      ==========   ==============   ==========   ==============
+    UN             No              No             No            No
+    SH             Yes             Yes            No            No
+    DF             No              Yes            No            No
+    EX             Yes             Yes            Yes           Yes
+==========      ==========   ==============   ==========   ==============
 
 These rules are implemented using the various glock operations which
 are defined for each type of glock. Not all types of glocks use
@@ -49,21 +56,23 @@ all the modes. Only inode glocks use the DF mode for example.
 
 Table of glock operations and per type constants:
 
-Field            | Purpose
-----------------------------------------------------------------------------
-go_xmote_th      | Called before remote state change (e.g. to sync dirty data)
-go_xmote_bh      | Called after remote state change (e.g. to refill cache)
-go_inval         | Called if remote state change requires invalidating the cache
-go_demote_ok     | Returns boolean value of whether its ok to demote a glock
-                 | (e.g. checks timeout, and that there is no cached data)
-go_lock          | Called for the first local holder of a lock
-go_unlock        | Called on the final local unlock of a lock
-go_dump          | Called to print content of object for debugfs file, or on
-                 | error to dump glock to the log.
-go_type          | The type of the glock, LM_TYPE_.....
-go_callback	 | Called if the DLM sends a callback to drop this lock
-go_flags	 | GLOF_ASPACE is set, if the glock has an address space
-                 | associated with it
+=============      =============================================================
+Field              Purpose
+=============      =============================================================
+go_xmote_th        Called before remote state change (e.g. to sync dirty data)
+go_xmote_bh        Called after remote state change (e.g. to refill cache)
+go_inval           Called if remote state change requires invalidating the cache
+go_demote_ok       Returns boolean value of whether its ok to demote a glock
+                   (e.g. checks timeout, and that there is no cached data)
+go_lock            Called for the first local holder of a lock
+go_unlock          Called on the final local unlock of a lock
+go_dump            Called to print content of object for debugfs file, or on
+                   error to dump glock to the log.
+go_type            The type of the glock, ``LM_TYPE_*``
+go_callback	   Called if the DLM sends a callback to drop this lock
+go_flags	   GLOF_ASPACE is set, if the glock has an address space
+                   associated with it
+=============      =============================================================
 
 The minimum hold time for each lock is the time after a remote lock
 grant for which we ignore remote demote requests. This is in order to
@@ -82,21 +91,25 @@ rather than via the glock.
 
 Locking rules for glock operations:
 
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
-
-N.B. Operations must not drop either the bit lock or the spinlock
-if its held on entry. go_dump and do_demote_ok must never block.
-Note that go_dump will only be called if the glock's state
-indicates that it is caching uptodate data.
+=============    ======================    =============================
+Operation        GLF_LOCK bit lock held    gl_lockref.lock spinlock held
+=============    ======================    =============================
+go_xmote_th           Yes                       No
+go_xmote_bh           Yes                       No
+go_inval              Yes                       No
+go_demote_ok          Sometimes                 Yes
+go_lock               Yes                       No
+go_unlock             Yes                       No
+go_dump               Sometimes                 Yes
+go_callback           Sometimes (N/A)           Yes
+=============    ======================    =============================
+
+.. Note::
+
+   Operations must not drop either the bit lock or the spinlock
+   if its held on entry. go_dump and do_demote_ok must never block.
+   Note that go_dump will only be called if the glock's state
+   indicates that it is caching uptodate data.
 
 Glock locking order within GFS2:
 
@@ -104,7 +117,7 @@ Glock locking order within GFS2:
  2. Rename glock (for rename only)
  3. Inode glock(s)
     (Parents before children, inodes at "same level" with same parent in
-     lock number order)
+    lock number order)
  4. Rgrp glock(s) (for (de)allocation operations)
  5. Transaction glock (via gfs2_trans_begin) for non-read operations
  6. i_rw_mutex (if required)
@@ -117,8 +130,8 @@ determine the lifetime of the inode in question. Locking of inodes
 is on a per-inode basis. Locking of rgrps is on a per rgrp basis.
 In general we prefer to lock local locks prior to cluster locks.
 
-                            Glock Statistics
-                           ------------------
+Glock Statistics
+----------------
 
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
 
 Due to the smoothing action of the updates, a step change in
 some input quantity being sampled will only fully be taken
@@ -195,10 +208,13 @@ as possible. There are always inaccuracies in any
 measuring system, but I hope this is as accurate as we
 can reasonably make it.
 
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
 
 Assuming that debugfs is mounted on /sys/kernel/debug and also
 that <fsname> is replaced with the name of the gfs2 filesystem
@@ -206,14 +222,16 @@ in question.
 
 The abbreviations used in the output as are follows:
 
-srtt     - Smoothed round trip time for non-blocking dlm requests
-srttvar  - Variance estimate for srtt
-srttb    - Smoothed round trip time for (potentially) blocking dlm requests
-srttvarb - Variance estimate for srttb
-sirt     - Smoothed inter-request time (for dlm requests)
-sirtvar  - Variance estimate for sirt
-dlm      - Number of dlm requests made (dcnt in glstats file)
-queue    - Number of glock requests queued (qcnt in glstats file)
+=========  ================================================================
+srtt       Smoothed round trip time for non blocking dlm requests
+srttvar    Variance estimate for srtt
+srttb      Smoothed round trip time for (potentially) blocking dlm requests
+srttvarb   Variance estimate for srttb
+sirt       Smoothed inter request time (for dlm requests)
+sirtvar    Variance estimate for sirt
+dlm        Number of dlm requests made (dcnt in glstats file)
+queue      Number of glock requests queued (qcnt in glstats file)
+=========  ================================================================
 
 The sbstats file contains a set of these stats for each glock type (so 8 lines
 for each type) and for each cpu (one column per cpu). The glstats file contains
@@ -224,9 +242,12 @@ The gfs2_glock_lock_time tracepoint prints out the current values of the stats
 for the glock in question, along with some addition information on each dlm
 reply that is received:
 
-status - The status of the dlm request
-flags  - The dlm request flags
-tdiff  - The time taken by this specific request
+======   =======================================
+status   The status of the dlm request
+flags    The dlm request flags
+tdiff    The time taken by this specific request
+======   =======================================
+
 (remaining fields as per above list)
 
 
diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index e7b46dac7079..0641429f53a2 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -69,6 +69,7 @@ Documentation for filesystem implementations.
    f2fs
    gfs2
    gfs2-uevents
+   gfs2-glocks
    hfs
    hfsplus
    hpfs
diff --git a/MAINTAINERS b/MAINTAINERS
index 50659d76976b..3354ed247d0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7179,7 +7179,7 @@ L:	cluster-devel@redhat.com
 S:	Supported
 W:	http://sources.redhat.com/cluster/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
-F:	Documentation/filesystems/gfs2*.txt
+F:	Documentation/filesystems/gfs2*
 F:	fs/gfs2/
 F:	include/uapi/linux/gfs2_ondisk.h
 
-- 
2.26.2

