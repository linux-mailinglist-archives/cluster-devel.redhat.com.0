Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA8315D0FA
	for <lists+cluster-devel@lfdr.de>; Fri, 14 Feb 2020 05:22:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581654129;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nVC4rWPsdyQOg2DyVJg13DaFCXatcQLU+jVxevWF5Lk=;
	b=N8e05hcRLMJ+2MOPWOoUaYouwU0eb/Sp1Br7RHhPXOa4JR+4UqLYyZ/sFNQ9rFxRTsN+91
	XiObnZifVulWQKS4Xolw63W0HOZ/jUblw7bY7+14jf9N1kB7Zo0OKDjB61+jEIJQ6ClVRc
	5rYYe/e0XPBuACK2Fz+2bh1zszarUhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-qQwb7_jKMmy15Y3ocrlfwA-1; Thu, 13 Feb 2020 23:22:07 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09BCF13E2;
	Fri, 14 Feb 2020 04:22:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65CAA790F3;
	Fri, 14 Feb 2020 04:22:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 62BCE8B2B3;
	Fri, 14 Feb 2020 04:22:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01E4LtMZ024565 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 23:21:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B474F2166B2B; Fri, 14 Feb 2020 04:21:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEF192166B2E
	for <cluster-devel@redhat.com>; Fri, 14 Feb 2020 04:21:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1619101D256
	for <cluster-devel@redhat.com>; Fri, 14 Feb 2020 04:21:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-244-ip2JPlvfMXSnSIFnql3GAw-1; Thu, 13 Feb 2020 23:21:48 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j2STx-0008Ig-7x; Fri, 14 Feb 2020 04:21:37 +0000
Date: Thu, 13 Feb 2020 20:21:37 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200214042137.GX7778@bombadil.infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
	<20200211010348.6872-2-willy@infradead.org>
	<e0f459af-bb5d-58b9-78be-5adf687477c0@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <e0f459af-bb5d-58b9-78be-5adf687477c0@nvidia.com>
X-MC-Unique: ip2JPlvfMXSnSIFnql3GAw-1
X-MC-Unique: qQwb7_jKMmy15Y3ocrlfwA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01E4LtMZ024565
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v5 01/13] mm: Fix the return type of
 __do_page_cache_readahead
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Feb 13, 2020 at 07:19:53PM -0800, John Hubbard wrote:
> On 2/10/20 5:03 PM, Matthew Wilcox wrote:
> > @@ -161,7 +161,7 @@ unsigned int __do_page_cache_readahead(struct addre=
ss_space *mapping,
> >  =09unsigned long end_index;=09/* The last page we want to read */
> >  =09LIST_HEAD(page_pool);
> >  =09int page_idx;
>=20
>=20
> What about page_idx, too? It should also have the same data type as nr_pa=
ges, as long as
> we're trying to be consistent on this point.
>=20
> Just want to ensure we're ready to handle those 2^33+ page readaheads... =
:)

Nah, this is just a type used internally to the function.  Getting the
API right for the callers is the important part.


