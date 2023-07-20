Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D831A75AE42
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Jul 2023 14:23:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689855784;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MRkLHZzoWRjQjiBAgAduTWjUfOY9V50XQ0uAIgRYqSQ=;
	b=FOsn79qcVsn3QDMugb4EP/4E6ZZZZy70759B81z4yWAmMxXYfT8lFk+LD1oIpX/PJN7nSn
	sVzZoXK13+yOJugtX7a9OoLOGvDc7F+tx2HIPh2LYQLF1IAeWjo5JrB0UU73ySGLa3fjCt
	d0b2k7frQuLF6SxBxm6Y3YN4yy/GwJY=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-FG0AiasgPNmKrD-Cvo-n-g-1; Thu, 20 Jul 2023 08:22:59 -0400
X-MC-Unique: FG0AiasgPNmKrD-Cvo-n-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 593FB3C0C49B;
	Thu, 20 Jul 2023 12:22:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C3A8200B41D;
	Thu, 20 Jul 2023 12:22:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0DD8A1946A71;
	Thu, 20 Jul 2023 12:22:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A9A2E1946A43 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 20 Jul 2023 12:22:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 993DB207B31A; Thu, 20 Jul 2023 12:22:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EE2D200B41D;
 Thu, 20 Jul 2023 12:22:46 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 20 Jul 2023 08:22:38 -0400
Message-Id: <20230720122241.1381845-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCHv4 v6.5-rc2 0/3] fs: dlm: lock cancellation
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

changes since v4:

- zero memory of info structure in dlm_posix_cancel() 

changes since v3:

- drop patch "fs: dlm: ignore DLM_PLOCK_FL_CLOSE flag results", we
  assume
  that plock ops with DLM_PLOCK_FL_CLOSE flag set will never fail.
- Let DLM_PLOCK_OP_CANCEL to always send a reply back. This is useful
  when
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

 fs/dlm/plock.c                 | 163 ++++++++++++++++++++++++++-------
 fs/gfs2/file.c                 |   9 +-
 fs/ocfs2/stack_user.c          |  13 +--
 include/linux/dlm_plock.h      |   2 +
 include/uapi/linux/dlm_plock.h |   1 +
 5 files changed, 137 insertions(+), 51 deletions(-)

-- 
2.31.1

