Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE3776BC2E
	for <lists+cluster-devel@lfdr.de>; Tue,  1 Aug 2023 20:20:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690914010;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HU1YfcrgfFeH9ojivES8mYEIbEGr/jJ0DBuVN+8yuTs=;
	b=bdUR/bB7dpILGUgJPAMNU0Ll9E5vHsJZHXrLlJ+MWHfwEo8rSbT9boYZ62gyYCa7MRrmtL
	/hUKL6h9/1qDq0deOE6SxZf1VDaFXxZb+SDejegY/ALceMY/O3JHLzmAT3zDz07kT9qNYk
	nx9jCGOi48xdJ2IRH6tEcjnPkezp8nU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203--5mZutE_MKW5Li2JhRXjWw-1; Tue, 01 Aug 2023 14:20:01 -0400
X-MC-Unique: -5mZutE_MKW5Li2JhRXjWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DA59100812B;
	Tue,  1 Aug 2023 18:20:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 204211454143;
	Tue,  1 Aug 2023 18:20:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8BB371946A74;
	Tue,  1 Aug 2023 18:19:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4901E194720D for <cluster-devel@listman.corp.redhat.com>;
 Tue,  1 Aug 2023 18:09:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3D09E1121330; Tue,  1 Aug 2023 18:09:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14F25112132D;
 Tue,  1 Aug 2023 18:09:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  1 Aug 2023 14:09:37 -0400
Message-Id: <20230801180950.3693180-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCHv2 dlm-next 00/13] fs: dlm: miscs and msgs
 processing changes
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

this patch fixes some missing spin_unlock() that was missing in commit
dc52cd2eff4a ("fs: dlm: fix F_CANCELLK to cancel pending request").
Otherwise this patch series contains:

- introduce a new debugfs entry to dump all pending callbacks in the per
  lkb callbacks queue.
- add plock char dev kernel tracepoints for debugging
- change things in parsing/processing dlm messages like only once
  dereferencing the sequence number of dlm recovery and avoid an additional
  spinlock later
- constify the dlm receive buffer, it should never be manipulated when
  parsing it.
- small change in version detection to not use RCOM_NAMES messages
- change to create midcomms node when configfs gets the cluster
  configuration

I try to prepare to switch the message processing from workqueue
context to softirq context. The patch "fs: dlm: create midcomms nodes
when configure" will remove creating midcomms nodes that create debugfs
entries from the message parsing context. The context for creating debugfs
entries is sleepable. The lifetime of a midcomms node is now similar like
lowcomms connection struct. Later we hopefully can merge the two hash
datastructures midcomms nodes and lowcomms connections into one.

- Alex

changes since v2:

- add a cover-letter
- fix a deadlock case in "fs: dlm: create midcomms nodes when configure"

Alexander Aring (13):
  fs: dlm: add missing spin_unlock
  fs: dlm: remove unused processed_nodes
  fs: dlm: debugfs for queued callbacks
  fs: dlm: check on plock ops when exit dlm
  fs: dlm: add plock dev tracepoints
  fs: dlm: remove clear_members_cb
  fs: dlm: cleanup lock order
  fs: dlm: get recovery sequence number as parameter
  fs: dlm: drop rxbuf manipulation in dlm_copy_master_names
  fs: dlm: drop rxbuf manipulation in dlm_recover_master_copy
  fs: dlm: constify receive buffer
  fs: dlm: create midcomms nodes when configure
  fs: dlm: don't use RCOM_NAMES for version detection

 fs/dlm/config.c            |   2 +-
 fs/dlm/debug_fs.c          | 101 +++++++++++-
 fs/dlm/dir.c               |  14 +-
 fs/dlm/dir.h               |   6 +-
 fs/dlm/dlm_internal.h      |   1 +
 fs/dlm/lock.c              | 120 ++++++++-------
 fs/dlm/lock.h              |  16 +-
 fs/dlm/lowcomms.c          |   1 -
 fs/dlm/member.c            |  15 +-
 fs/dlm/member.h            |   2 +-
 fs/dlm/midcomms.c          | 304 ++++++++++++++-----------------------
 fs/dlm/midcomms.h          |   1 +
 fs/dlm/plock.c             |   9 ++
 fs/dlm/rcom.c              | 102 +++++++------
 fs/dlm/rcom.h              |  15 +-
 fs/dlm/recover.c           |  60 ++++----
 fs/dlm/recover.h           |  14 +-
 fs/dlm/recoverd.c          |  16 +-
 fs/dlm/requestqueue.c      |   3 +-
 fs/dlm/requestqueue.h      |   3 +-
 include/trace/events/dlm.h |  51 +++++++
 21 files changed, 489 insertions(+), 367 deletions(-)

-- 
2.31.1

