Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1213C44C1EA
	for <lists+cluster-devel@lfdr.de>; Wed, 10 Nov 2021 14:09:00 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-DjWu9mJANiS-Io-JTFcx-g-1; Wed, 10 Nov 2021 08:08:56 -0500
X-MC-Unique: DjWu9mJANiS-Io-JTFcx-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A39571023F4D;
	Wed, 10 Nov 2021 13:08:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D69967842;
	Wed, 10 Nov 2021 13:08:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2BF734ED40;
	Wed, 10 Nov 2021 13:08:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AAD35SP010515 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 10 Nov 2021 08:03:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 853CF40CFD10; Wed, 10 Nov 2021 13:03:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8028840CFD0B
	for <cluster-devel@redhat.com>; Wed, 10 Nov 2021 13:03:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BCB185A5AA
	for <cluster-devel@redhat.com>; Wed, 10 Nov 2021 13:03:05 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-594-Ly0SSenDNa-OCieLI2L4Mg-1;
	Wed, 10 Nov 2021 08:03:03 -0500
X-MC-Unique: Ly0SSenDNa-OCieLI2L4Mg-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9048967373; Wed, 10 Nov 2021 13:55:27 +0100 (CET)
Date: Wed, 10 Nov 2021 13:55:27 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20211110125527.GA25465@lst.de>
References: <20211110113842.517426-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211110113842.517426-1-agruenba@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, "Darrick J . Wong" <djwong@kernel.org>,
	stable@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [5.15 REGRESSION] iomap: Fix inline extent
 handling in iomap_readpage
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 10, 2021 at 12:38:42PM +0100, Andreas Gruenbacher wrote:
> +	if (iomap->type == IOMAP_INLINE) {
> +		/*
> +		 * The filesystem sets iomap->length to the size of the inline
> +		 * data.  We're at the end of the file, so we know that the
> +		 * rest of the page needs to be zeroed out.
> +		 */
> +		iomap->length = iomap_read_inline_data(iter, page);
> +		return iomap->length;

You can't just change iomap->length here.  Fix the file system to
return the right length, please.

