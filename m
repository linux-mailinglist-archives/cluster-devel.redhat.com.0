Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4A8742FAC
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Jun 2023 23:49:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688075341;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=CxyyOmJ2nBaP5oZISxjUTMQCTchwO5n1FW2gvrrZGUY=;
	b=ENnPLftfBuLEKNrxlwN2vLfsIu16OcSDzVGi55ViWci5WW0OHStFiEEUCEOekfHKfROJzY
	w2ls2j347wHU4l4+1EyYDNLOPOrs7aiOMfcNneLuIaYVKwNby1yC746vTljqsPGhEFIQbM
	jhVm3qIacVFNDgUV/mpmytZCbB8XIS8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-Uh6vVjl-NUWx77BzuuGn8w-1; Thu, 29 Jun 2023 17:48:59 -0400
X-MC-Unique: Uh6vVjl-NUWx77BzuuGn8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7362B85A58A;
	Thu, 29 Jun 2023 21:48:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B5DB1121314;
	Thu, 29 Jun 2023 21:48:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 415261946A47;
	Thu, 29 Jun 2023 21:48:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0D5D119465B6 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 29 Jun 2023 21:48:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CA46F4CD0C1; Thu, 29 Jun 2023 21:48:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2EAC492C13
 for <cluster-devel@redhat.com>; Thu, 29 Jun 2023 21:48:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8D393806706
 for <cluster-devel@redhat.com>; Thu, 29 Jun 2023 21:48:54 +0000 (UTC)
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-88-hYBku7NDM2W-zbrj4gfa_A-1; Thu,
 29 Jun 2023 17:48:49 -0400
X-MC-Unique: hYBku7NDM2W-zbrj4gfa_A-1
Received: by b221-3.in.mailobj.net [192.168.90.23] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Thu, 29 Jun 2023 23:48:48 +0200 (CEST)
X-EA-Auth: 3d8hHa0w8x3ZBksDX9dBDvaPGrI6/UQcOzXV03+dW5/YH8jZrj6A54owRMUqSTdC4zEFF+HTckpwy1YG1yyVVQC252uw6y2c
Date: Fri, 30 Jun 2023 03:18:37 +0530
From: Deepak R Varma <drv@mailo.com>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org
Message-ID: <cover.1688073459.git.drv@mailo.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH v3 0/6] gfs2: kmap{_atomic} conversion to
 kmap_local_{page/folio}
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
Cc: Deepak R Varma <drv@mailo.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Sumitra Sharma <sumitraartsy@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: mailo.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch series proposes to replace the kmap/kmap_atomic implementation to the
preferred kmap_local_* APIs.

The code blocks for this module where kmap/kmap_atomic calls are implemented do
not appear to depend on disabling page-faults or preemption. Hence such code
blocks are safe for converting to improved kmap_local_{page,folio} APIs.

Note: The proposed patches are build tested only.

Initially, only a single patch was sent and now being converted into a patch
series including the other files/functions of this module. Hence all patches,
that are included for the first time in this series are also marked as v3.

Changes in v3:
   - Patch set introduced to include all gfs2 kmap conversions
   - Patches 3/6 through 6/6 are included to build the series
   - Initial stand-alone patch split into 2 patches [1/6 and 2/6]

Changes in v2:
   - 3/6 to 6/6: None.
   - 1/6 + 2/6: Correct patch description for the replacement function name from
     kmap_local_folio to kmap_local_page

Deepak R Varma (6):
  gfs2: Replace kmap_atomic() by kmap_local_page() in stuffed_readpage
  gfs2: Replace kmap_atomic()+memcpy by memcpy_from_page()
  gfs2: Replace kmap() by kmap_local_page() in gfs2_unstuffer_page
  gfs2: Replace kmap_atomic() by kmap_local_page() in lops.c
  gfs2: Replace kmap() by kmap_local_page() in gfs2_read_super
  gfs2: Replace kmap_atomic() by kmap_local_page() in
    gfs2_write_buf_to_page

 fs/gfs2/aops.c       | 13 ++++++-------
 fs/gfs2/bmap.c       |  4 ++--
 fs/gfs2/lops.c       | 12 ++++++------
 fs/gfs2/ops_fstype.c |  4 ++--
 fs/gfs2/quota.c      |  4 ++--
 5 files changed, 18 insertions(+), 19 deletions(-)

-- 
2.34.1



