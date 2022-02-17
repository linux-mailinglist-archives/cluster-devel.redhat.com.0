Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CCF4BA9F5
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Feb 2022 20:39:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645126798;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VAQM24iskKtwm5URJa19ajq8XEfAbPjF3thbNKBqKeU=;
	b=FwIXbF8D/RUlcEtgaYecjHyod+E18VkDSple6QPIKoN/VjCAR4DbrviBO57BI1TvFfYrUf
	PzdsU/29Mh2VM/FZ+0GvJ4X4PF5t0tkBZzRomJP/TRsmk56yZKPRjMHGmG+BYmpPGCbOLa
	R9H1YKCxzRko7890IjKWrGjiTYZDy1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-COn9rZ-3Nc-RqODBD4eqGQ-1; Thu, 17 Feb 2022 14:39:57 -0500
X-MC-Unique: COn9rZ-3Nc-RqODBD4eqGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A6F22F45;
	Thu, 17 Feb 2022 19:39:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA230100EA05;
	Thu, 17 Feb 2022 19:39:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6692F1809CB8;
	Thu, 17 Feb 2022 19:39:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21HJdkTT004241 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 17 Feb 2022 14:39:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 863BB100EBBE; Thu, 17 Feb 2022 19:39:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22AFD1009962;
	Thu, 17 Feb 2022 19:39:37 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Feb 2022 14:39:11 -0500
Message-Id: <20220217193917.3292717-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 0/6] fs: dlm: cleanup plock code
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi,

this patch-series cleanups some plock code handling and remove the
plock_op vs plock_xop casting which had made trouble in the past. Also
I add the logging improvment handling to see when a plock op was not
being found, the wait was interrupted before.

This followed up cleanup patch series should be applied on top of the
previous stable patch "[PATCH dlm/next] fs: dlm: fix plock invalid read".

Thanks.

- Alex

changes since v2:
 - explain more "fs: dlm: replace sanity checks with WARN_ON"
 - add "fs: dlm: remove unnecessary INIT_LIST_HEAD()"
 - add "fs: dlm: move global to static inits"

Alexander Aring (6):
  fs: dlm: replace sanity checks with WARN_ON
  fs: dlm: cleanup plock_op vs plock_xop
  fs: dlm: rearrange async condition return
  fs: dlm: improve plock logging if interrupted
  fs: dlm: remove unnecessary INIT_LIST_HEAD()
  fs: dlm: move global to static inits

 fs/dlm/plock.c | 154 ++++++++++++++++++++++---------------------------
 1 file changed, 69 insertions(+), 85 deletions(-)

-- 
2.31.1

