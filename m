Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.145.221.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DFF680C32
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Jan 2023 12:45:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675079099;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Csw6bIhabdcSNe/QLWRpGOHgzc5D4uaYsZ15/VPcHfk=;
	b=W5CQb9ODy23sxfA40SQ/WZhrHnFUrYzJYNSf/UEwSf0RBpfm++mIpyiPOwsyldlspBMH6y
	yWEaSWzEsb6PpAJ+/m0jQp1UHVlZDzgywSdXpTfOX6+ATmLqx6dYzAmn/FLXTgQAXkAwx4
	voqQ4ZV6R/KRv/EgxRPRiE+QNkqIik8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-Wgnv41NjMF2l68uXcTAO5w-1; Mon, 30 Jan 2023 06:44:56 -0500
X-MC-Unique: Wgnv41NjMF2l68uXcTAO5w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5786811E9C;
	Mon, 30 Jan 2023 11:44:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E28C1121314;
	Mon, 30 Jan 2023 11:44:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 427A419465B9;
	Mon, 30 Jan 2023 11:44:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C771E194658C for <cluster-devel@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 05:12:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BBFE82026D76; Fri, 27 Jan 2023 05:12:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4DEC2026D4B
 for <cluster-devel@redhat.com>; Fri, 27 Jan 2023 05:12:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91F262817235
 for <cluster-devel@redhat.com>; Fri, 27 Jan 2023 05:12:46 +0000 (UTC)
Received: from r3-22.sinamail.sina.com.cn (r3-22.sinamail.sina.com.cn
 [202.108.3.22]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-_VufRZviOnadfTbpOkOCpw-1; Fri, 27 Jan 2023 00:12:42 -0500
X-MC-Unique: _VufRZviOnadfTbpOkOCpw-1
Received: from 241.45.215.139.adsl-pool.jlccptt.net.cn (HELO
 pek-lxu-l1.corp.ad.wrs.com)([139.215.45.241])
 by sina.com (172.16.97.32) with ESMTP
 id 63D35BC600033C3A; Fri, 27 Jan 2023 13:06:16 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
X-SMAIL-MID: 389226628955
From: eadavis@sina.com
To: syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com
Date: Fri, 27 Jan 2023 13:10:09 +0800
Message-Id: <20230127051009.3881703-1-eadavis@sina.com>
In-Reply-To: <0000000000002b5e2405f14e860f@google.com>
References: <0000000000002b5e2405f14e860f@google.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Mon, 30 Jan 2023 11:44:51 +0000
Subject: [Cluster-devel] [PATCH] gfs2: Fix uaf for qda in gfs2_quota_sync
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, Edward Adam Davis <eadavis@sina.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Edward Adam Davis <eadavis@sina.com>

[   81.372851][ T5532] CPU: 1 PID: 5532 Comm: syz-executor.0 Not tainted 6.2.0-rc1-syzkaller-dirty #0
[   81.382080][ T5532] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/12/2023
[   81.392343][ T5532] Call Trace:
[   81.395654][ T5532]  <TASK>
[   81.398603][ T5532]  dump_stack_lvl+0x1b1/0x290
[   81.418421][ T5532]  gfs2_assert_warn_i+0x19a/0x2e0
[   81.423480][ T5532]  gfs2_quota_cleanup+0x4c6/0x6b0
[   81.428611][ T5532]  gfs2_make_fs_ro+0x517/0x610
[   81.457802][ T5532]  gfs2_withdraw+0x609/0x1540
[   81.481452][ T5532]  gfs2_inode_refresh+0xb2d/0xf60
[   81.506658][ T5532]  gfs2_instantiate+0x15e/0x220
[   81.511504][ T5532]  gfs2_glock_wait+0x1d9/0x2a0
[   81.516352][ T5532]  do_sync+0x485/0xc80
[   81.554943][ T5532]  gfs2_quota_sync+0x3da/0x8b0
[   81.559738][ T5532]  gfs2_sync_fs+0x49/0xb0
[   81.564063][ T5532]  sync_filesystem+0xe8/0x220
[   81.568740][ T5532]  generic_shutdown_super+0x6b/0x310
[   81.574112][ T5532]  kill_block_super+0x79/0xd0
[   81.578779][ T5532]  deactivate_locked_super+0xa7/0xf0
[   81.584064][ T5532]  cleanup_mnt+0x494/0x520
[   81.593753][ T5532]  task_work_run+0x243/0x300
[   81.608837][ T5532]  exit_to_user_mode_loop+0x124/0x150
[   81.614232][ T5532]  exit_to_user_mode_prepare+0xb2/0x140
[   81.619820][ T5532]  syscall_exit_to_user_mode+0x26/0x60
[   81.625287][ T5532]  do_syscall_64+0x49/0xb0
[   81.629710][ T5532]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   81.636292][ T5532] RIP: 0033:0x7efdd688d517
[   81.640728][ T5532] Code: ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
[   81.660550][ T5532] RSP: 002b:00007fff34520ce8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
[   81.669413][ T5532] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007efdd688d517
[   81.677403][ T5532] RDX: 00007fff34520db9 RSI: 000000000000000a RDI: 00007fff34520db0
[   81.685388][ T5532] RBP: 00007fff34520db0 R08: 00000000ffffffff R09: 00007fff34520b80
[   81.695973][ T5532] R10: 0000555555ca38b3 R11: 0000000000000246 R12: 00007efdd68e6b24
[   81.704152][ T5532] R13: 00007fff34521e70 R14: 0000555555ca3810 R15: 00007fff34521eb0
[   81.712868][ T5532]  </TASK>

The function "gfs2_quota_cleanup()" may be called in the function "do_sync()",
This will cause the qda obtained in the function "qd_check_sync" to be released, resulting in the occurrence of uaf.
In order to avoid this uaf, we can increase the judgment of "sdp->sd_quota_bitmap" released in the function
"gfs2_quota_cleanup" to confirm that "sdp->sd_quota_list" has been released.

Link: https://lore.kernel.org/all/0000000000002b5e2405f14e860f@google.com
Reported-and-tested-by: syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
 fs/gfs2/quota.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 1ed1722..4cf66bd 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1321,6 +1321,9 @@ int gfs2_quota_sync(struct super_block *sb, int type)
 					qda[x]->qd_sync_gen =
 						sdp->sd_quota_sync_gen;
 
+			if (!sdp->sd_quota_bitmap)
+				break;
+
 			for (x = 0; x < num_qd; x++)
 				qd_unlock(qda[x]);
 		}
-- 
2.39.0

