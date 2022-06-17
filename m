Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F78554FE04
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Jun 2022 22:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655496051;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Cz19+39bu1F+VcZbBnbUCSx3kragJGGJNA2ZKzFrxeY=;
	b=B3tppQpYHBcFjmGWcywZGAbPV2litjUbdLd5DNAbjQCEZWs68u7mogxXIdZiAsZyPlKJls
	+M8Xg/RK85MlrGFzBUch5oPvQq4B2fzHg8/qtFGDpvUPVeQXY0Mt7wlQvNZZ3aavH8kzfh
	55Q7GkQjBg2B+HOszwDiaZX3CC+xf3g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-3O9xgD4eMk-FkCzblTIcSQ-1; Fri, 17 Jun 2022 16:00:48 -0400
X-MC-Unique: 3O9xgD4eMk-FkCzblTIcSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D5FB802C17;
	Fri, 17 Jun 2022 20:00:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5D6B2166B29;
	Fri, 17 Jun 2022 20:00:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 43D181947066;
	Fri, 17 Jun 2022 20:00:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ADE20194705F for <cluster-devel@listman.corp.redhat.com>;
 Fri, 17 Jun 2022 20:00:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 86CC2492CA6; Fri, 17 Jun 2022 20:00:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C0B1492CA3;
 Fri, 17 Jun 2022 20:00:39 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 17 Jun 2022 16:00:31 -0400
Message-Id: <20220617200036.251778-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCH dlm/next 0/5] fs: dlm: prepare for deprecate
 DLM API
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

This patch series deprecates some dlm API which will be removed in later
Linux kernel releases (aim v5.22). Distribution should switch to
CONFIG_DLM_DEPRECATED_API to N. Upcoming patches for libdlm will
disable to use any of the deprecated API even if user sets it.

The reason to deprecate some API is that it's either not useful anymore
or it makes probably some problems if it's getting used.

It's a little bit an ifdef-hell right now but it marks certain areas which
will be removed in v5.22 (except the additional changes in the UAPI
header).

- Alex

Alexander Aring (5):
  fs: dlm: add comment about lkb IFL flags
  fs: dlm: remove warn waiter handling
  fs: dlm: remove timeout from dlm_user_adopt_orphan
  fs: dlm: add API deprecation warning
  fs: dlm: don't use deprecated API by default

 fs/dlm/Kconfig        |   9 +++
 fs/dlm/Makefile       |   2 +-
 fs/dlm/config.c       |  21 ++++---
 fs/dlm/config.h       |   3 +-
 fs/dlm/dlm_internal.h |  27 ++++++++-
 fs/dlm/lock.c         | 131 ++++++++++++++++--------------------------
 fs/dlm/lock.h         |   9 ++-
 fs/dlm/lockspace.c    |  22 ++++++-
 fs/dlm/netlink.c      |   8 +++
 fs/dlm/user.c         |  21 ++++++-
 10 files changed, 156 insertions(+), 97 deletions(-)

-- 
2.31.1

