Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 296F74B8CEA
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Feb 2022 16:53:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645026814;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3idVZy//xFRmvcdKI/sxDmqUWEZRONB/THxSlwkLg7k=;
	b=Q1gCdwVhFoBdakOUTsLCAnL7rGFEej3OGmWamqyr/cE6nnJALIc+ujbU6rRBOf3ZMYSycY
	HV3mxBURjFZn+Zed2tSxhGX2CtMKPbFQmUnb2RouoeJcYWMDpFlokb2BPoRdbkxuj12qty
	vsNRrn2UVCLCXVqKxJIdunGvuofFg0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-FNG6UFRgNcWsn0SG8tPgZw-1; Wed, 16 Feb 2022 10:53:31 -0500
X-MC-Unique: FNG6UFRgNcWsn0SG8tPgZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DF4B2F44;
	Wed, 16 Feb 2022 15:53:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F7AA752CB;
	Wed, 16 Feb 2022 15:53:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7165F180065D;
	Wed, 16 Feb 2022 15:53:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21GFrPZJ023109 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 16 Feb 2022 10:53:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 143E5752CB; Wed, 16 Feb 2022 15:53:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 13859752D0;
	Wed, 16 Feb 2022 15:53:13 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 16 Feb 2022 10:53:03 -0500
Message-Id: <20220216155307.2994688-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 0/4] fs: dlm: cleanup plock code
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Alexander Aring (4):
  fs: dlm: replace sanity checks with WARN_ON
  fs: dlm: cleanup plock_op vs plock_xop
  fs: dlm: rearrange async condition return
  fs: dlm: improve plock logging if interrupted

 fs/dlm/plock.c | 137 +++++++++++++++++++++++--------------------------
 1 file changed, 64 insertions(+), 73 deletions(-)

-- 
2.31.1

