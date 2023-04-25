Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EFA6EE4E3
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Apr 2023 17:40:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682437202;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KkWeKhTEaXp9JdQmO6LKpuT+4ZnqVRHShCUqBP7ryfw=;
	b=dVqo8kaQ9mdwhbpO1WKNvcAE3fDyEoEVjnd+Zs8YSUSsn6toccEEN5UR2OkXrmCoS42LgL
	cqrgdbCBN5xsRSPxrgOMK3X2F0ajjyb/VBmaMSqerv2NjtwgLxwiDcOdGI5qPSm5dcV+WL
	85L0csIbhs5aoYmjYjxAD7dX9DHa3o4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-hwjkDcwjPA69vB7AXT15Xw-1; Tue, 25 Apr 2023 11:39:58 -0400
X-MC-Unique: hwjkDcwjPA69vB7AXT15Xw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC9B32932499;
	Tue, 25 Apr 2023 15:39:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5DBEF40C201F;
	Tue, 25 Apr 2023 15:39:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5D85A19465A3;
	Tue, 25 Apr 2023 15:39:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E6A941946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 25 Apr 2023 15:39:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ABB4E492B03; Tue, 25 Apr 2023 15:39:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 701A9492B0F;
 Tue, 25 Apr 2023 15:39:51 +0000 (UTC)
Date: Tue, 25 Apr 2023 10:39:51 -0500
From: David Teigland <teigland@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20230425153951.GB28392@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [GIT PULL] dlm updates for 6.4
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull dlm updates from tag:

git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git dlm-6.4

Change summary:

Remove some unused features (related to lock timeouts) that have been
previously scheduled for removal.

Fix a bug where the pending callback flag would be incorrectly cleared,
which could potentially result in missing a completion callback.

Use an unbound workqueue for dlm socket handling so that socket
operations can be processed with less delay.

Fix possible lockspace join connection errors with large clusters (e.g.
over 16 nodes) caused by a small socket backlog setting.

Use atomic bit ops for internal flags to help avoid mistakes copying
flag values from messages.

Fix recently introduced bug where memory for lvb data could be
unnecessarily allocated for a lock.

Thanks,
Dave


Alexander Aring (11):
      fs: dlm: fix DLM_IFL_CB_PENDING gets overwritten
      fs: dlm: add unbound flag to dlm_io workqueue
      fs: dlm: remove deprecated code parts
      fs: dlm: rename stub to local message flag
      fs: dlm: remove DLM_IFL_LOCAL_MS flag
      fs: dlm: store lkb distributed flags into own value
      fs: dlm: change dflags to use atomic bits
      fs: dlm: move internal flags to atomic ops
      fs: dlm: rsb hash table flag value to atomic ops
      fs: dlm: switch lkb_sbflags to atomic ops
      fs: dlm: stop unnecessarily filling zero ms_extra bytes

Edwin Török (1):
      DLM: increase socket backlog to avoid hangs with 16 nodes


 fs/dlm/Kconfig                    |   9 -
 fs/dlm/Makefile                   |   1 -
 fs/dlm/ast.c                      |  11 +-
 fs/dlm/config.c                   |  21 --
 fs/dlm/config.h                   |   3 -
 fs/dlm/debug_fs.c                 |   8 +-
 fs/dlm/dlm_internal.h             | 154 +++++++----
 fs/dlm/lock.c                     | 533 ++++++++++++--------------------------
 fs/dlm/lock.h                     |  17 --
 fs/dlm/lockspace.c                |  29 +--
 fs/dlm/lowcomms.c                 |   6 +-
 fs/dlm/main.c                     |   9 +-
 fs/dlm/memory.c                   |   2 +-
 fs/dlm/netlink.c                  | 139 ----------
 fs/dlm/rcom.c                     |   2 +-
 fs/dlm/recover.c                  |   2 +-
 fs/dlm/recoverd.c                 |   2 -
 fs/dlm/user.c                     |  34 +--
 include/linux/dlm.h               |   3 -
 include/trace/events/dlm.h        |  12 +-
 include/uapi/linux/dlm.h          |   1 +
 include/uapi/linux/dlm_netlink.h  |  60 -----
 include/uapi/linux/dlmconstants.h |   5 +-
 23 files changed, 299 insertions(+), 764 deletions(-)
 delete mode 100644 fs/dlm/netlink.c
 delete mode 100644 include/uapi/linux/dlm_netlink.h

