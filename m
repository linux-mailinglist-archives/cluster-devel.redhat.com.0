Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 00BDC3CBDAB
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Jul 2021 22:23:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626466986;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x8yoeXP0g4lZuB5FhonRPhfP1ApZ2MxJCMrClKooo+U=;
	b=BPJoIhIa+zbwqbN5uTNONdz7CKJ9qWVoz+pM+Xyu0J7PhhXoI64BY59BiTD94k/6IhsaAW
	mBsM6wd0fiYjsG+qhZy4zCgY34vHjMpE8RIlMfVS+DjdXCogor93bSHLWAT1ACbxPtZUsd
	GkUcagrEBmy215DiQ4/yY4emA9U+Fww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-0xaE-pxmOJWDocknTxQL8A-1; Fri, 16 Jul 2021 16:23:04 -0400
X-MC-Unique: 0xaE-pxmOJWDocknTxQL8A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D2E09F938;
	Fri, 16 Jul 2021 20:23:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3353D26FB8;
	Fri, 16 Jul 2021 20:23:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A69871809CB3;
	Fri, 16 Jul 2021 20:23:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16GKMunS026014 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 16 Jul 2021 16:22:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 173AA5D741; Fri, 16 Jul 2021 20:22:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D5855D6D5;
	Fri, 16 Jul 2021 20:22:52 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 16 Jul 2021 16:22:33 -0400
Message-Id: <20210716202245.1262791-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v5.14-rc1 00/12] fs: dlm: combine similar
	functionaility
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi,

this patch contains some cleanups and smaller fixes, however the big
change in this patch series is that we combine more functionaility into
one function and introduce more callbacks when TCP vs SCTP differs in
their handling.

- Alex

Alexander Aring (12):
  fs: dlm: use sk->sk_socket instead of con->sock
  fs: dlm: use READ_ONCE for config var
  fs: dlm: fix typo in tlv prefix
  fs: dlm: clear CF_APP_LIMITED on close
  fs: dlm: cleanup and remove _send_rcom
  fs: dlm: introduce con_next_wq helper
  fs: dlm: move to static proto ops
  fs: dlm: introduce generic listen
  fs: dlm: auto load sctp module
  fs: dlm: generic connect func
  fs: dlm: fix multiple empty writequeue alloc
  fs: dlm: move receive loop into receive handler

 fs/dlm/dlm_internal.h |   2 +-
 fs/dlm/lockspace.c    |   2 +-
 fs/dlm/lowcomms.c     | 769 +++++++++++++++++++++---------------------
 fs/dlm/rcom.c         |  29 +-
 4 files changed, 398 insertions(+), 404 deletions(-)

-- 
2.27.0

