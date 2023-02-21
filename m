Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FDD69E9A3
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Feb 2023 22:40:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677015644;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=39Rj2BKoL+YqW1jFJCHGNlUHNcqDatPw/e87RknX+zw=;
	b=JqzeZf74/wMRZt4H1gQH0F4yphHPJIo1GMjca74lPD/05M4bTE3YqZ8Fe/wbMzU+zaoyMC
	5mMFJjrTZukuYj+tbtRhSyYKaMdBGxAhhCjHnQSCBZyr7ey0F1NnJlh8tJdTdFaS7ynU/x
	4KPRfxW8Qiisw250UwIy7a0E7oHHC9E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-RLDHtWmMNGGLIXUhnwGQRA-1; Tue, 21 Feb 2023 16:40:40 -0500
X-MC-Unique: RLDHtWmMNGGLIXUhnwGQRA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 462E0803D53;
	Tue, 21 Feb 2023 21:40:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 050F54051E45;
	Tue, 21 Feb 2023 21:40:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D99DA194658C;
	Tue, 21 Feb 2023 21:40:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 81BBB1946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 21 Feb 2023 21:40:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3C3A2440DF; Tue, 21 Feb 2023 21:40:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 125B5440D9;
 Tue, 21 Feb 2023 21:40:35 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 21 Feb 2023 16:40:08 -0500
Message-Id: <20230221214014.871804-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH dlm/next 0/6] fs: dlm: pending dlm patches
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

this patch-series contains all pending patches and should be able to
apply on the next -rc1 release. I added a patch to this series to remove
the deprecated API code parts. Also I changed a little bit the commit
message from "Edwin Török" to remove some "|" and white space at the end
of the line.

- Alex


Alexander Aring (5):
  fs: dlm: add unbound flag to dlm_io workqueue
  fs: dlm: fix DLM_IFL_CB_PENDING gets overwritten
  fs: dlm: move internal non shared flags to bitops
  fs: dlm: remove DLM_IFL_STUB_MS flag
  fs: dlm: remove deprecated code parts

Edwin Török (1):
  DLM: increase socket backlog to avoid hangs with 16 nodes

 fs/dlm/Kconfig                    |   9 -
 fs/dlm/Makefile                   |   1 -
 fs/dlm/ast.c                      |   9 +-
 fs/dlm/config.c                   |  21 --
 fs/dlm/config.h                   |   3 -
 fs/dlm/dlm_internal.h             |  63 ++---
 fs/dlm/lock.c                     | 366 +++++++-----------------------
 fs/dlm/lock.h                     |  17 --
 fs/dlm/lockspace.c                |  25 +-
 fs/dlm/lowcomms.c                 |   6 +-
 fs/dlm/main.c                     |   9 +-
 fs/dlm/netlink.c                  | 139 ------------
 fs/dlm/recover.c                  |   2 +-
 fs/dlm/recoverd.c                 |   2 -
 fs/dlm/user.c                     |  34 +--
 include/linux/dlm.h               |   3 -
 include/trace/events/dlm.h        |   8 -
 include/uapi/linux/dlm.h          |   1 +
 include/uapi/linux/dlm_netlink.h  |  60 -----
 include/uapi/linux/dlmconstants.h |   5 +-
 20 files changed, 121 insertions(+), 662 deletions(-)
 delete mode 100644 fs/dlm/netlink.c
 delete mode 100644 include/uapi/linux/dlm_netlink.h

-- 
2.31.1

