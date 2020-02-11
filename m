Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F19C7158E94
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Feb 2020 13:35:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581424499;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1tb6eE/Sja9z4yv8qlwR7sUpjMacB043UkIImSAJLZE=;
	b=MItbdkMx3U+j+r+J5AtfpOALPTeoznT1Nz/Z0GhDpgwtQPDscoJV4AmygdiOc9WVnR7QF7
	+TKJwHttBxfjYSJ8weXzxuvWaU2LFg0wHqTAiP60HX3WLBuUKfifxFyt/QU0CLAGEQWZU8
	fsOm4di4/86fu/5citEhLEzq40V3y0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-0ty-pfBuPZWbyMIAhb-u-w-1; Tue, 11 Feb 2020 07:34:54 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 634E310054E3;
	Tue, 11 Feb 2020 12:34:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3E618EA1A;
	Tue, 11 Feb 2020 12:34:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E86618089CD;
	Tue, 11 Feb 2020 12:34:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01BCYiLB024788 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 Feb 2020 07:34:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E8BDCD93C0; Tue, 11 Feb 2020 12:34:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4EEDD9600
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 12:34:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89C14802073
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 12:34:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-163-rUpS1aq9P--yqbiDFMqArQ-1; Tue, 11 Feb 2020 07:34:39 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j1UkI-0006ev-Kh; Tue, 11 Feb 2020 12:34:30 +0000
Date: Tue, 11 Feb 2020 04:34:30 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
Message-ID: <20200211123430.GT8731@bombadil.infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
	<20200211010348.6872-2-willy@infradead.org>
	<SN4PR0401MB3598602411B75B46F5267B829B180@SN4PR0401MB3598.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SN4PR0401MB3598602411B75B46F5267B829B180@SN4PR0401MB3598.namprd04.prod.outlook.com>
X-MC-Unique: rUpS1aq9P--yqbiDFMqArQ-1
X-MC-Unique: 0ty-pfBuPZWbyMIAhb-u-w-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01BCYiLB024788
X-loop: cluster-devel@redhat.com
Cc: "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	"linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 11, 2020 at 08:19:14AM +0000, Johannes Thumshirn wrote:
> On 11/02/2020 02:05, Matthew Wilcox wrote:
> > even though I'm pretty sure we're not going to readahead more than 2^32
> > pages ever.
>=20
> And 640K is more memory than anyone will ever need on a computer *scnr*

Sure, but bandwidth just isn't increasing quickly enough to have
this make sense.  2^32 pages even on our smallest page size machines
is 16GB.  Right now, we cap readahead at just 256kB.  If we did try to
readahead 16GB, we'd be occupying a PCIe gen4 x4 drive for two seconds,
just satisfying this one readahead.  PCIe has historically doubled in
bandwidth every three years or so, so to get this down to something
reasonable like a hundredth of a second, we're looking at PCIe gen12 in
twenty years or so.  And I bet we still won't do it (also, I doubt PCIe
will continue doubling bandwidth every three years).

And Linus has forbidden individual IOs over 2GB anyway, so not happening
until he's forced to see the error of his ways ;-)


