Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9294B68D4F6
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Feb 2023 11:58:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675767528;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T72ATA6wUotKW8LGTziMV9R5QlpHjyMldvSaNwl00JQ=;
	b=Ab9oz3p6UsaY96cxHAk/J3fnBZ0OSo4BHYmH4q7J9JBMZCCFzei0/0zgHpQZgiPKzxpSfY
	1lEX1opF/YcdN58UZmDD/wviEm+ytqfZMb1JQZyjTf90GVFkCcC48gVNtUuoKO2yH4pYMC
	Wn8wltEGBaM+jbEkNNg4xer5eS1gQiQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312--dMG7brvNxq_DziTuyiqdA-1; Tue, 07 Feb 2023 05:58:44 -0500
X-MC-Unique: -dMG7brvNxq_DziTuyiqdA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C5C2811E6E;
	Tue,  7 Feb 2023 10:58:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80E41492B21;
	Tue,  7 Feb 2023 10:58:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 21BFD19465B7;
	Tue,  7 Feb 2023 10:58:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A911E194658F for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Feb 2023 09:03:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9A098492C3E; Mon,  6 Feb 2023 09:03:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9296F492C3C
 for <cluster-devel@redhat.com>; Mon,  6 Feb 2023 09:03:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76EF5858F09
 for <cluster-devel@redhat.com>; Mon,  6 Feb 2023 09:03:30 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com
 [45.249.212.187]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-pnj80-2TOkOwrojv5XslYA-1; Mon, 06 Feb 2023 04:03:28 -0500
X-MC-Unique: pnj80-2TOkOwrojv5XslYA-1
Received: from kwepemm600015.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4P9KZQ2YnGznW3B;
 Mon,  6 Feb 2023 16:44:46 +0800 (CST)
Received: from huawei.com (10.175.101.6) by kwepemm600015.china.huawei.com
 (7.193.23.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Feb
 2023 16:46:51 +0800
From: ChenXiaoSong <chenxiaosong2@huawei.com>
To: <rpeterso@redhat.com>, <agruenba@redhat.com>
Date: Mon, 6 Feb 2023 17:55:43 +0800
Message-ID: <20230206095543.539186-3-chenxiaosong2@huawei.com>
In-Reply-To: <20230206095543.539186-1-chenxiaosong2@huawei.com>
References: <20230206095543.539186-1-chenxiaosong2@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600015.china.huawei.com (7.193.23.52)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Tue, 07 Feb 2023 10:58:39 +0000
Subject: [Cluster-devel] [PATCH 2/2] gfs2: fix sleep from invalid context
 bug in gfs2_glock_wait()
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
Cc: cluster-devel@redhat.com, chenxiaosong2@huawei.com,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Syzkaller reported BUG as follows:

  BUG: sleeping function called from invalid context at
       fs/gfs2/glock.c:1316
  Call Trace:
   __dump_stack lib/dump_stack.c:88 [inline]
   dump_stack_lvl+0x1b1/0x290 lib/dump_stack.c:106
   __might_resched+0x4e9/0x6b0 kernel/sched/core.c:10036
   gfs2_glock_wait+0x52/0x2a0 fs/gfs2/glock.c:1316
   gfs2_glock_nq_init fs/gfs2/glock.h:262 [inline]
   gfs2_freeze_lock+0x5f/0xc0 fs/gfs2/util.c:107
   signal_our_withdraw fs/gfs2/util.c:160 [inline]
   gfs2_withdraw+0x5cc/0x1540 fs/gfs2/util.c:351
   gfs2_ail1_empty+0x8c9/0x950 fs/gfs2/log.c:368
   gfs2_flush_revokes+0x59/0x80 fs/gfs2/log.c:806
   revoke_lo_before_commit+0x2b/0xcf0 fs/gfs2/lops.c:869
   lops_before_commit fs/gfs2/lops.h:40 [inline]
   gfs2_log_flush+0xc8e/0x26a0 fs/gfs2/log.c:1093
   do_sync+0xa3c/0xc80 fs/gfs2/quota.c:975
   gfs2_quota_sync+0x3da/0x8b0 fs/gfs2/quota.c:1318
   gfs2_sync_fs+0x49/0xb0 fs/gfs2/super.c:650
   sync_filesystem+0xe8/0x220 fs/sync.c:56
   generic_shutdown_super+0x6b/0x310 fs/super.c:474
   kill_block_super+0x79/0xd0 fs/super.c:1386
   deactivate_locked_super+0xa7/0xf0 fs/super.c:332
   cleanup_mnt+0x494/0x520 fs/namespace.c:1291
   task_work_run+0x243/0x300 kernel/task_work.c:179
   exit_task_work include/linux/task_work.h:38 [inline]
   do_exit+0x644/0x2150 kernel/exit.c:867
   do_group_exit+0x1fd/0x2b0 kernel/exit.c:1012
   __do_sys_exit_group kernel/exit.c:1023 [inline]
   __se_sys_exit_group kernel/exit.c:1021 [inline]
   __x64_sys_exit_group+0x3b/0x40 kernel/exit.c:1021
   do_syscall_x64 arch/x86/entry/common.c:50 [inline]
   do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
   entry_SYSCALL_64_after_hwframe+0x63/0xcd

Fix this by calling gfs2_withdraw() outside of the spinlock context.

Link: https://syzkaller.appspot.com/bug?id=3D7bd882c47078df844b5a82550559d6=
9482d5c3c1
Signed-off-by: ChenXiaoSong <chenxiaosong2@huawei.com>
---
 fs/gfs2/log.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index c62c914702ba..945540c0a3cf 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -825,8 +825,10 @@ void gfs2_flush_revokes(struct gfs2_sbd *sdp)
 =09unsigned int max_revokes =3D atomic_read(&sdp->sd_log_revokes_available=
);
=20
 =09gfs2_log_lock(sdp);
-=09gfs2_ail1_empty(sdp, max_revokes);
+=09__gfs2_ail1_empty(sdp, max_revokes);
 =09gfs2_log_unlock(sdp);
+
+=09gfs2_ail1_withdraw(sdp);
 }
=20
 /**
--=20
2.31.1

