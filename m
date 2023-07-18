Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CA375842C
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Jul 2023 20:07:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689703670;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0LxZ4wLhre+tj0sV3i83n0Bu7Q8ujCWgNiGos+rdEew=;
	b=DvBPxqGXuKaCVdUC58ylrpVYHkzzzahu13C8e0DOGT+bwMEqHg0qd/3+93EUirZWAAfLY3
	vFSoJxlZh08knMKyN9m2lbMYFeAfTDF+bVwKnZFmFZJq354C+4CC/CypXDnnqLwyv8yOci
	zaQUfq6YySF15yaTGfziFPN7EhgXdTk=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-Eki5EAhDOPqG2tPOsL6M7A-1; Tue, 18 Jul 2023 14:07:43 -0400
X-MC-Unique: Eki5EAhDOPqG2tPOsL6M7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 527E928040A2;
	Tue, 18 Jul 2023 18:07:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 275681454142;
	Tue, 18 Jul 2023 18:07:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 985D919465B5;
	Tue, 18 Jul 2023 18:07:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1CD19194658D for <cluster-devel@listman.corp.redhat.com>;
 Tue, 18 Jul 2023 18:07:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 28505200C0C4; Tue, 18 Jul 2023 18:07:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA63D200BA8B;
 Tue, 18 Jul 2023 18:07:28 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 18 Jul 2023 14:07:18 -0400
Message-Id: <20230718180721.745569-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCHv3 v6.5-rc2 0/3] fs: dlm: lock cancellation
 feature
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
Cc: ocfs2-devel@lists.linux.dev, mark@fasheh.com, cluster-devel@redhat.com,
 joseph.qi@linux.alibaba.com, jlbec@evilplan.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

this patch series implements lock cancellation feature. Either if a
POSIX F_SETLKW got interrupted by a signal (most common use case) or
lockd sends a F_CANCELLK request.

As I note: the current nfs handling seems to be broken. This patch
assumes that the current behaviour works. Future patches will fix the
nfs handling which seems to be broken anyway.

- Alex

changes since v3:

- drop patch "fs: dlm: ignore DLM_PLOCK_FL_CLOSE flag results", we assume
  that plock ops with DLM_PLOCK_FL_CLOSE flag set will never fail.
- Let DLM_PLOCK_OP_CANCEL to always send a reply back. This is useful when
  the op fails, e.g. older dlm_controld will return -EINVAL and we can
  implement F_CANCELLK which does not have a reference of the plock_op
  instance.
- remove DLM_PLOCK_OP_FLAG_SENT as it was only a optimization for a
  rare case. That DLM_PLOCK_OP_CANCEL sends a reply back will
  synchronize it now.
- remove DLM_PLOCK_OP_FLAG_INTERRUPTED as it's not necessary anymore
  because waiting for a reply of DLM_PLOCK_OP_CANCEL we don't need to
  handle this special case anymore.
- add "fs: dlm: remove twice newline" because I saw this while doing nfs
  lockd experiments.

Alexander Aring (3):
  fs: dlm: remove twice newline
  fs: dlm: allow to F_SETLKW getting interrupted
  fs: dlm: fix F_CANCELLK to cancel pending request

 fs/dlm/plock.c                 | 162 ++++++++++++++++++++++++++-------
 fs/gfs2/file.c                 |   9 +-
 fs/ocfs2/stack_user.c          |  13 +--
 include/linux/dlm_plock.h      |   2 +
 include/uapi/linux/dlm_plock.h |   1 +
 5 files changed, 136 insertions(+), 51 deletions(-)

-- 
2.31.1

