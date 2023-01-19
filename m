Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F052D6731B8
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Jan 2023 07:22:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674109355;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=JaCFZzx/CkDBMhMozrNgNFMv5me/9lPZbZomefEjvWM=;
	b=aKdBcM02gxBgqdhKgVwAaumcCQ1RMHqwDP7cQYCMOAro5eZKa/KwkbIfCsr6L/XBi94BYH
	0ZQas3FWDRQ2KjnNGc1yYPueX8sBHHFmA/ggy23SfPr8H76N9rCOz2Q36z3gEVvaPWgsYe
	JX6T3Ikwkj54d/Vxwt+9HYY6wtIaNY8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-WXC5SjCxOouL1n_FYW5xPQ-1; Thu, 19 Jan 2023 01:22:25 -0500
X-MC-Unique: WXC5SjCxOouL1n_FYW5xPQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 499C33811F50;
	Thu, 19 Jan 2023 06:22:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 25E522026D76;
	Thu, 19 Jan 2023 06:22:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DB96A1946A76;
	Thu, 19 Jan 2023 06:22:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B70EE1946A6D for <cluster-devel@listman.corp.redhat.com>;
 Thu, 19 Jan 2023 06:22:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7CDF62166B2A; Thu, 19 Jan 2023 06:22:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 766A02166B29
 for <cluster-devel@redhat.com>; Thu, 19 Jan 2023 06:22:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55F42857D0D
 for <cluster-devel@redhat.com>; Thu, 19 Jan 2023 06:22:21 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-nRAvkSgQPxOi9UdeshkLFg-1; Thu, 19 Jan 2023 01:22:17 -0500
X-MC-Unique: nRAvkSgQPxOi9UdeshkLFg-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6466367373; Thu, 19 Jan 2023 07:22:13 +0100 (CET)
Date: Thu, 19 Jan 2023 07:22:13 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20230119062213.GA17855@lst.de>
References: <20220719041311.709250-1-hch@lst.de>
 <20220719041311.709250-2-hch@lst.de>
 <CAHc6FU5A71L0r2k5z7QoBZe3pO+5G1nMNvKfGmJzprQWFyDCog@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU5A71L0r2k5z7QoBZe3pO+5G1nMNvKfGmJzprQWFyDCog@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH 1/4] gfs2: stop using generic_writepages
 in gfs2_ail1_start_one
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
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 18, 2023 at 10:22:20PM +0100, Andreas Gruenbacher wrote:
> The above change means that instead of calling generic_writepages(),
> we end up calling filemap_fdatawrite_wbc() -> do_writepages() ->
> mapping->a_ops->writepages(). But that's something completely
> different; the writepages address space operation operates is outward
> facing, while we really only want to write out the dirty buffers /
> pages in the underlying address space. In case of journaled data
> inodes, gfs2_jdata_writepages() actually ends up trying to create a
> filesystem transaction, which immediately hangs because we're in the
> middle of a log flush.
> 
> So I'm tempted to revert the following two of your commits; luckily
> that's independent from the iomap_writepage() removal:
> 
>   d3d71901b1ea ("gfs2: remove ->writepage")
>   b2b0a5e97855 ("gfs2: stop using generic_writepages in gfs2_ail1_start_one")

generic_writepages is gone in linux-next, and I'd really like to keep
it that way.  So if you have to do this, please open code it
using write_cache_pages and a direct call to the writepage method of
choice.

> I think we could go through iomap_writepages() instead of
> generic_writepages() here as well,  but that's for another day.

Well, that would obviously be much better, and actually help with the
goal of removing ->writepage.

