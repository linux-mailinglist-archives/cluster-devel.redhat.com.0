Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 087806ACF73
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Mar 2023 21:48:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678135712;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+Crxy6mL86VNf+74z+NC1yhDdXZfEknf5PEk5jrIzuc=;
	b=IVVhGXqNfljZ24kyZwDRvqTBXUqcy7csu+CgRxe2Q1ys7rhkeuEoaEESiLJKaxlmQ+FkDx
	AEG+u5FY46CXdU/VufzK/yn8uqkYSrovsRnsphOV+7uLtslnZNZOKkNwZEEyfLZ18Jm+mv
	3mcZajrdciJMTOZhlvaFArx7Q9AVW7A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-BEBj7fwSPFekYT-NBOg_tg-1; Mon, 06 Mar 2023 15:48:28 -0500
X-MC-Unique: BEBj7fwSPFekYT-NBOg_tg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95C458588E1;
	Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B570492C14;
	Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F2BB819465B3;
	Mon,  6 Mar 2023 20:48:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E2BA91946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Mar 2023 20:48:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D0B41440DE; Mon,  6 Mar 2023 20:48:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A81C0440DF;
 Mon,  6 Mar 2023 20:48:25 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  6 Mar 2023 15:48:07 -0500
Message-Id: <20230306204819.2747646-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCHv2 v6.3-rc1 00/12] fs: dlm: pending patches
 for v6.3-rc1
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

this patch-series contains all pending patches and should be able to
apply on the v6.3-rc1 release. I added a patch to this series to remove
the deprecated API code parts. Also I changed a little bit the commit
message from "Edwin Török" to remove some "|" and white space at the end
of the line. Added patches to make flag handling atomically, at least we
had avoidable problems with iflags... however it is not completely
atomically yet and can might be improved more in future.

The first patch is already submitted to stable and should be backported
to releases since the issue came in.

- Alex

changes since v2:
- use BIT meaning for bit defines
- rebase on v6.3-rc1 (but there were no conflicts)
- add patch to rename stub to local
- changes shared flags to distributed flags
- add patch to split distributed flags into own
  value instead of directly convert internal flags
  to atomic bit ops. Means lkb_iflags values stays
  mostly the same for debugfs. They just don't
  contain USER and ORPHAN anymore which are now in
  lkb_dflags.
- add patches for other flag handling which _might_
  be used in a different context which could run
  parallel with other flag manipulation. However
  setting or reading bit values need to be safe and
  is not done atomically.

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
  fs: dlm: switch ls_exflags to atomic ops

Edwin Török (1):
  DLM: increase socket backlog to avoid hangs with 16 nodes

 fs/dlm/Kconfig                    |   9 -
 fs/dlm/Makefile                   |   1 -
 fs/dlm/ast.c                      |  11 +-
 fs/dlm/config.c                   |  21 --
 fs/dlm/config.h                   |   3 -
 fs/dlm/debug_fs.c                 |   8 +-
 fs/dlm/dlm_internal.h             | 177 ++++++----
 fs/dlm/lock.c                     | 531 ++++++++++--------------------
 fs/dlm/lock.h                     |  17 -
 fs/dlm/lockspace.c                |  31 +-
 fs/dlm/lowcomms.c                 |   6 +-
 fs/dlm/main.c                     |   9 +-
 fs/dlm/memory.c                   |   2 +-
 fs/dlm/netlink.c                  | 139 --------
 fs/dlm/rcom.c                     |   8 +-
 fs/dlm/recover.c                  |   2 +-
 fs/dlm/recoverd.c                 |   2 -
 fs/dlm/user.c                     |  34 +-
 include/linux/dlm.h               |   3 -
 include/trace/events/dlm.h        |  12 +-
 include/uapi/linux/dlm.h          |   1 +
 include/uapi/linux/dlm_netlink.h  |  60 ----
 include/uapi/linux/dlmconstants.h |   5 +-
 23 files changed, 324 insertions(+), 768 deletions(-)
 delete mode 100644 fs/dlm/netlink.c
 delete mode 100644 include/uapi/linux/dlm_netlink.h

-- 
2.31.1

