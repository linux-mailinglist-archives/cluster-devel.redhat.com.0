Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D55E58136E
	for <lists+cluster-devel@lfdr.de>; Tue, 26 Jul 2022 14:51:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658839888;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B0YgJKO/6cBt0lI/psvdgddps/rE6a1ErVlBqQnFaoI=;
	b=VS4Xz7jhPQUiDhOtKNo5VumdTAeP7r9Tl7BO5UI2TSqqUsH2eLDy+drAaMF99993p7O+/e
	Q4ENEXpBCzrWSjQPK6lYQlLwgCL/13dTOCOtrJcX7HXl2r7Mzuy2e+6AMenQc52AQWU+3J
	vrCB6dj2ozPxYtUG1f9vGiGhjRSVbfU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-OJO_l4Z7NvqCyEh2iuhj7w-1; Tue, 26 Jul 2022 08:51:25 -0400
X-MC-Unique: OJO_l4Z7NvqCyEh2iuhj7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F86B8032F1;
	Tue, 26 Jul 2022 12:51:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB56C2026D07;
	Tue, 26 Jul 2022 12:51:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AFFB81945D97;
	Tue, 26 Jul 2022 12:51:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C45C71945D86 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 26 Jul 2022 12:51:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A2ED3492CA7; Tue, 26 Jul 2022 12:51:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DEBF492CA4;
 Tue, 26 Jul 2022 12:51:19 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 26 Jul 2022 08:51:16 -0400
Message-Id: <20220726125118.955056-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCHv3 dlm/next 0/2] fs: dlm: some callback and
 lowcomm fixes
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

I currently look a little bit deeper into the callback handling of dlm.
I have some local branches which does more some rework and moving away
from the lkb_callbacks[] array per lkb and using a queue for handling
callbacks. However those are issues which I currently found for now
and should be fixed.

- Alex

changes since v3:
 - add Fixes tag
 - add Cc: stable

changes since v2:

 - drop patches 2/3 and 3/3 as it looks okay. Sorry about the noise.
 - change commit messages regarding v2 changes.
 - add patch "fs: dlm: fix race in lowcomms"

Alexander Aring (2):
  fs: dlm: fix race in lowcomms
  fs: dlm: fix race between test_bit() and queue_work()

 fs/dlm/ast.c      | 6 ++++--
 fs/dlm/lowcomms.c | 4 ++++
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.31.1

