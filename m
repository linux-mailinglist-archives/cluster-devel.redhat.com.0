Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFC45805CA
	for <lists+cluster-devel@lfdr.de>; Mon, 25 Jul 2022 22:38:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658781532;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sogPp70ZC2D8gfw2PwjlEtTgvtGFqDXiU9fOvLqURpk=;
	b=M1HAl0q/lWrU1NoMmpj28NJL8TZ4z1mbZNrGDpOY5ZUUcNOKH5LmSRET/Cre/KTDOGHqCs
	GOXnfD/uKJQsaLutcu2+2y6CmRtVmNMi1yjwGcM6sn48utJbu+fXhpNdFfl8G8n2HCt3Ow
	Y9vAf2Pm7BRJPsaidLUFJSxBvdKW44Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-8vZa_j82NmujLCDNRCiyNQ-1; Mon, 25 Jul 2022 16:38:48 -0400
X-MC-Unique: 8vZa_j82NmujLCDNRCiyNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF33A380114D;
	Mon, 25 Jul 2022 20:38:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3C512166B26;
	Mon, 25 Jul 2022 20:38:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4B24E1945D96;
	Mon, 25 Jul 2022 20:38:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 947CB1945D86 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 25 Jul 2022 20:38:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8093B40C1288; Mon, 25 Jul 2022 20:38:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B73B40C128A;
 Mon, 25 Jul 2022 20:38:44 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 25 Jul 2022 16:38:30 -0400
Message-Id: <20220725203835.860277-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm/next 0/5] fs: dlm: misc cleanups
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
Cc: linux-raid@vger.kernel.org, joseph.qi@linux.alibaba.com, mark@fasheh.com,
 cluster-devel@redhat.com, song@kernel.org, jlbec@evilplan.org,
 ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

as I am working on some bigger change in the callback handling I
separated this patch series from a bigger series. This series removes
unused prototype, change a lock to spinlock because no sleepable
context, adding traces for user space locks, moving DLM_LSFL_FS out of
uapi because the user space should never set this flag and move
LSFL_CB_DELAY to kernel space lockspaces only.

- Alex

Alexander Aring (5):
  fs: dlm: remove dlm_del_ast prototype
  fs: dlm: change ls_clear_proc_locks to spinlock
  fs: dlm: trace user space callbacks
  fs: dlm: move DLM_LSFL_FS out of uapi
  fs: dlm: LSFL_CB_DELAY only for kernel lockspaces

 drivers/md/md-cluster.c    |  4 ++--
 fs/dlm/ast.c               | 13 +++++++------
 fs/dlm/ast.h               |  1 -
 fs/dlm/dlm_internal.h      |  2 +-
 fs/dlm/lock.c              | 32 ++++++++++++++++++++++++--------
 fs/dlm/lockspace.c         | 30 +++++++++++++++++++++++++-----
 fs/dlm/lockspace.h         | 13 +++++++++++++
 fs/dlm/user.c              | 17 +++++++++++------
 fs/gfs2/lock_dlm.c         |  2 +-
 fs/ocfs2/stack_user.c      |  2 +-
 include/linux/dlm.h        |  3 ---
 include/trace/events/dlm.h | 23 +++++++++++++----------
 include/uapi/linux/dlm.h   |  1 -
 13 files changed, 98 insertions(+), 45 deletions(-)

-- 
2.31.1

