Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DF34D019A
	for <lists+cluster-devel@lfdr.de>; Mon,  7 Mar 2022 15:41:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646664079;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xD3oQRlPJ/G7nfHwrwRBw1SwLzcuZeQeLGLF7QY38zQ=;
	b=N8WB8fnWyDGbMRXG9YIG03zsP/9RlE5Kq30gPizRCmNhNSDKFiWrsAB1u49DySlul1dL2Y
	MpPN+q20e/bvaM+glWbNEl6yNl5itEOxYmpviDHz1xtUoadxQAyjBZDYe9xwKz/e67+K0x
	M8UPxRLbIjAUYkV1lUyGnXYE0LhwQR4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-GV9hHPmlOhqTufEVYZW8cg-1; Mon, 07 Mar 2022 09:41:16 -0500
X-MC-Unique: GV9hHPmlOhqTufEVYZW8cg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 624ED899EC1;
	Mon,  7 Mar 2022 14:41:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5AD5C0809D;
	Mon,  7 Mar 2022 14:41:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 864FF19305A5;
	Mon,  7 Mar 2022 14:41:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ADE3E1931BE9 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  7 Mar 2022 14:41:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BC3094EC64; Mon,  7 Mar 2022 14:41:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3983083591;
 Mon,  7 Mar 2022 14:40:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  7 Mar 2022 09:40:48 -0500
Message-Id: <20220307144048.2451280-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: move some midcomms
 WARN_ON to BUG
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Recently those warnings were triggered on gfs2 handling by calling
dlm API which runs into a BUG() because -ENOBUFS had beedn returned.
Those cases which has a WARN_ON() are not related to any memory failure
but should never happen. It's because we reset a midcomms state and the
dlm api still tries to transmit something which should be prevented by
dlm application layer handling e.g. locks.

Call trace of warning was:

[14003.162881] Call Trace:
[14003.162883]  [<000003ff80796d70>] dlm_midcomms_get_mhandle+0x170/0x1f0 [dlm]
[14003.162892] ([<000003ff80796d6c>] dlm_midcomms_get_mhandle+0x16c/0x1f0 [dlm])
[14003.162901]  [<000003ff80787366>] create_message+0x56/0x100 [dlm]
[14003.162909]  [<000003ff8078849c>] send_common+0x7c/0x130 [dlm]
[14003.162928]  [<000003ff8078b50c>] _convert_lock+0x3c/0x140 [dlm]
[14003.162936]  [<000003ff8078b698>] convert_lock+0x88/0xd0 [dlm]
[14003.162944]  [<000003ff80790008>] dlm_lock+0x158/0x1b0 [dlm]
[14003.162952]  [<000003ff807ff4c6>] gdlm_lock+0x1f6/0x2f0 [gfs2]
[14003.162997]  [<000003ff807d96c8>] do_xmote+0x1f8/0x440 [gfs2]
[14003.163008]  [<000003ff807d9d88>] gfs2_glock_nq+0x88/0x130 [gfs2]
[14003.163020]  [<000003ff807fac92>] gfs2_statfs_sync+0x52/0x180 [gfs2]
[14003.163031]  [<000003ff807f2b70>] gfs2_quotad+0xc0/0x360 [gfs2]
[14003.163043]  [<0000000050527cfc>] kthread+0x17c/0x190
[14003.163061]  [<00000000504af5dc>] __ret_from_fork+0x3c/0x60
[14003.163064]  [<0000000050d6df4a>] ret_from_fork+0xa/0x30

Call trace of BUG() was:

 #0 [8026be60] __machine_kexec at 504c09ee
 #1 [8026bea0] pcpu_delegate at 504c389e
 #2 [380004ab8b0] smp_call_ipl_cpu at 504c4b66
 #3 [380004ab8d0] __crash_kexec at 505c488a
 #4 [380004ab9a8] panic at 50d58682
 #5 [380004aba48] die at 504c1b28
 #6 [380004abab0] __do_pgm_check at 50d60966
 #7 [380004abb00] pgm_check_handler at 50d6e088
 PSW:  0704c00180000000 000003ff807d97e6 (do_xmote+790 [gfs2])
 GPRS: c0000000ffffbfff 0000000000000027 0000000000000067 00000000ffffbfff
       00000380004ab798 00000380004ab790 000003ff807f2b70 000003ff80810df0
       0000000086115000 00000380004abd98 0000000000000001 0000000083ef9540
       0000000081421500 0000000000000400 000003ff807d97e2 00000380004abc60
 #0 [380004abcb8] gfs2_glock_nq at 3ff807d9d88 [gfs2]
 #1 [380004abcf0] gfs2_statfs_sync at 3ff807fac92 [gfs2]
 #2 [380004abd88] gfs2_quotad at 3ff807f2b70 [gfs2]
 #3 [380004abe18] kthread at 50527cfc
 #4 [380004abe70] __ret_from_fork at 504af5dc
 #5 [380004abea0] ret_from_fork at 50d6df4a

A vmcore file was captured when BUG() on gfs2 level was being triggered.
After analyzing vmcore I had no issues found and specific lock states like
"ls->ls_in_recovery" was in write state, so the above call trace should
never occur. There is a small cap between the WARN_ON() call trace and the
BUG() in gfs2 call so the vmcore file cannot be trusted because the
specific lock states could be different in the call trace of WARN_ON().

To be prepared next time and having an accurate vmcore file we move the
WARN_ON() to BUG(). The problem was probably related to a corosync error
where dlm_controld log showed the following errors multiple times:

Feb 24 12:12:40 4008 cpg_dispatch error 2

This could end in a nondeterministic behaviour in the upcall/downcall
mechanism of fencing/new config (recovery) handling. The reasons for
those errors are still unknown.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 3635e42b0669..46bd1d84c7b8 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -1110,7 +1110,7 @@ struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 		break;
 	default:
 		dlm_free_mhandle(mh);
-		WARN_ON(1);
+		BUG();
 		goto err;
 	}
 
@@ -1153,7 +1153,7 @@ void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh)
 		break;
 	default:
 		srcu_read_unlock(&nodes_srcu, mh->idx);
-		WARN_ON(1);
+		BUG();
 		break;
 	}
 }
-- 
2.31.1

