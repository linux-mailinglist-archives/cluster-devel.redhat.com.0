Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.153.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDA145466F
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Nov 2021 13:31:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-4-EXOkeTH-Ok2qh41v8FP06g-1; Wed, 17 Nov 2021 07:31:49 -0500
X-MC-Unique: EXOkeTH-Ok2qh41v8FP06g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A75C8799EB;
	Wed, 17 Nov 2021 12:31:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C2C05BAE0;
	Wed, 17 Nov 2021 12:31:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C81B05533E;
	Wed, 17 Nov 2021 12:31:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHCVaCc027782 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 07:31:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0FB762026D46; Wed, 17 Nov 2021 12:31:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BE862026D5D
	for <cluster-devel@redhat.com>; Wed, 17 Nov 2021 12:31:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FBC1181B7A1
	for <cluster-devel@redhat.com>; Wed, 17 Nov 2021 12:31:33 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-292-FJHkxk9HNNiX-FPmMUf-OQ-1; Wed, 17 Nov 2021 07:31:31 -0500
X-MC-Unique: FJHkxk9HNNiX-FPmMUf-OQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 447FD68AFE; Wed, 17 Nov 2021 13:31:28 +0100 (CET)
Date: Wed, 17 Nov 2021 13:31:27 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20211117123127.GA21935@lst.de>
References: <20211117103202.44346-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211117103202.44346-1-agruenba@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, "Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] iomap: iomap_read_inline_data cleanup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 17, 2021 at 11:32:02AM +0100, Andreas Gruenbacher wrote:
> Change iomap_read_inline_data to return 0 or an error code; this
> simplifies the callers.  Add a description.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

