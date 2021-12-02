Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 675EF466ADF
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Dec 2021 21:23:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638476611;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=w021Tpdo5pJeQvNYAb/OQMM5QaKdXEhvolEbUPWfcLQ=;
	b=S4UJysf223+BORBlaINrGQT+fzYWbeqLyMtoNxqnut1PPuReX/yK6vTC4u4FFd3W6d9av+
	EBiNfWJqChxF89yRY05wlN8g3S681eXDDYX0giGhxPHSNS+BIkEJtkwj4qG4VE2vsOwRud
	xbmx3g+FwkYxM8kdPiH7aDK9j/s1veg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-Q-YK3SO0M6OZICP_yUxk6g-1; Thu, 02 Dec 2021 15:23:28 -0500
X-MC-Unique: Q-YK3SO0M6OZICP_yUxk6g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 443EE94EEC;
	Thu,  2 Dec 2021 20:23:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36AF74ABA2;
	Thu,  2 Dec 2021 20:23:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8767C1809CB7;
	Thu,  2 Dec 2021 20:23:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B2KL38j028334 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 2 Dec 2021 15:21:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B92FD10023AE; Thu,  2 Dec 2021 20:21:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4AA5B1010426;
	Thu,  2 Dec 2021 20:21:03 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  2 Dec 2021 15:20:39 -0500
Message-Id: <20211202202039.1386193-7-aahringo@redhat.com>
In-Reply-To: <20211202202039.1386193-1-aahringo@redhat.com>
References: <20211202202039.1386193-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, wferi@debian.org, vvidic@debian.org
Subject: [Cluster-devel] [PATCH dlm-tool 6/6] python: add ebpf histogram
	example
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds an example how a measurement between a kernel dlm_lock()
and their ast callback can be captured to get at the end a histogram.
This is hopefully a start of more useful dlm tracing collection with use
of ebpf.
---
 python/ebpf/README     |  6 ++++
 python/ebpf/dlmhist.py | 78 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 python/ebpf/README
 create mode 100755 python/ebpf/dlmhist.py

diff --git a/python/ebpf/README b/python/ebpf/README
new file mode 100644
index 00000000..dec59ed0
--- /dev/null
+++ b/python/ebpf/README
@@ -0,0 +1,6 @@
+In this directory are some ebpf tracing examples. It requires bcc toolchain
+(usually known as bcc package name) and the python bcc module (usually known
+as python3-bcc package name).
+
+Also the current kernel headers need to be available or activate
+CONFIG_IKHEADERS in your kernel configuration.
diff --git a/python/ebpf/dlmhist.py b/python/ebpf/dlmhist.py
new file mode 100755
index 00000000..ed1eab4f
--- /dev/null
+++ b/python/ebpf/dlmhist.py
@@ -0,0 +1,78 @@
+#!/usr/bin/python
+#
+# This example shows how to capture latency between a dlm_lock() kernel
+# call for DLM_LOCK_EX requests with flag DLM_LKF_NOQUEUE and the ast
+# response.
+#
+# You will probably see two line peaks, one in case of that the current
+# node is the lock master and another one which requires network
+# communication. There is currently no way to filter them out, so the
+# second peak is interessting to get an idea what time it takes to
+# call dlm_lock() and get a response back.
+
+from bcc import BPF
+
+import threading
+
+b = BPF(text="""
+#include <uapi/linux/ptrace.h>
+#include <uapi/linux/dlm.h>
+
+BPF_HASH(start, u32);
+BPF_HISTOGRAM(dist, u64);
+
+#define DLM_HASH(args) (args->ls_id ^ args->lkb_id)
+
+TRACEPOINT_PROBE(dlm, dlm_lock_start)
+{
+    u64 ts = bpf_ktime_get_ns();
+    u32 hash = DLM_HASH(args);
+
+    if (args->flags & DLM_LKF_NOQUEUE &&
+        args->mode == DLM_LOCK_EX)
+        start.update(&hash, &ts);
+
+    return 0;
+}
+
+TRACEPOINT_PROBE(dlm, dlm_lock_end)
+{
+    u32 hash = DLM_HASH(args);
+
+    if (args->error != 0)
+        start.delete(&hash);
+
+    return 0;
+}
+
+TRACEPOINT_PROBE(dlm, dlm_ast)
+{
+    u32 hash = DLM_HASH(args);
+    u64 *tsp, delta;
+
+    tsp = start.lookup(&hash);
+    if (tsp != 0) {
+        start.delete(&hash);
+        delta = bpf_ktime_get_ns() - *tsp;
+
+        if (args->sb_status != 0)
+            return 0;
+
+        dist.increment(bpf_log2l(delta));
+    }
+
+    return 0;
+}
+""")
+
+print("Tracing... Hit Ctrl-C anytime to end.")
+
+forever = threading.Event()
+try:
+    forever.wait()
+except KeyboardInterrupt:
+    print()
+
+print("log2 histogram")
+print("--------------")
+b["dist"].print_log2_hist("ns")
-- 
2.27.0

