Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 125466D4034
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Apr 2023 11:22:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680513771;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=sy3H02Yklmpq02OAKYlLX6Sc0hq4r61yxZwpspFLrV4=;
	b=e3rOeevBW5CLVf1ITmyEDtSChCU1TM8oYF9rznl0t3trdBQyuK9tl42CF/6Pn8czteH6pC
	QREhpZNw+mi1v0WomqGp3xB3ZeM2BSR7jYW7cLW3JcuCoqGIVEnijdOSiPMY9HHX3tPMeM
	WR3RrP6jZr8ap48fyB1013afw/MvPso=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-plXH38XSOKqyffFt-jG0CQ-1; Mon, 03 Apr 2023 05:22:48 -0400
X-MC-Unique: plXH38XSOKqyffFt-jG0CQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED7EF299E750;
	Mon,  3 Apr 2023 09:22:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A6DF4140E94F;
	Mon,  3 Apr 2023 09:22:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 71DA619465B1;
	Mon,  3 Apr 2023 09:22:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 459E719465BC for <cluster-devel@listman.corp.redhat.com>;
 Fri, 31 Mar 2023 12:28:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 382564042AC6; Fri, 31 Mar 2023 12:28:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 300824042AC0
 for <cluster-devel@redhat.com>; Fri, 31 Mar 2023 12:28:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15D401C01B3A
 for <cluster-devel@redhat.com>; Fri, 31 Mar 2023 12:28:32 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-L5DZkeVEMOu4pwuLg-oqew-1; Fri, 31 Mar 2023 08:28:30 -0400
X-MC-Unique: L5DZkeVEMOu4pwuLg-oqew-1
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230331122829euoutp0278c88099c3fc6f03416f98eac41d95b1~RgMKT8jRV0669706697euoutp02R
 for <cluster-devel@redhat.com>; Fri, 31 Mar 2023 12:28:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230331122829euoutp0278c88099c3fc6f03416f98eac41d95b1~RgMKT8jRV0669706697euoutp02R
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230331122828eucas1p2221a593a3ccb1b434b1da25a71533046~RgMKBh0II1636116361eucas1p2T;
 Fri, 31 Mar 2023 12:28:28 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 69.8A.09966.CE1D6246; Fri, 31
 Mar 2023 13:28:28 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230331122828eucas1p18e0bbbda45a6955f59fc82b29f42a8bb~RgMJifuNI3167431674eucas1p1Z;
 Fri, 31 Mar 2023 12:28:28 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230331122828eusmtrp201ce7800d6dbc2a659cda30347164a5b~RgMJhvdcU3136031360eusmtrp2K;
 Fri, 31 Mar 2023 12:28:28 +0000 (GMT)
X-AuditID: cbfec7f4-d39ff700000026ee-91-6426d1ece90a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 69.7F.09583.CE1D6246; Fri, 31
 Mar 2023 13:28:28 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230331122828eusmtip254994547f7b3b5d847ad1a6ec553e362~RgMJVz-6Q2915729157eusmtip2I;
 Fri, 31 Mar 2023 12:28:28 +0000 (GMT)
Received: from localhost (106.110.32.140) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 31 Mar 2023 13:28:27 +0100
Date: Fri, 31 Mar 2023 14:20:11 +0200
From: Pankaj Raghav <p.raghav@samsung.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Message-ID: <20230331122011.nq27xmkqmajvx6a5@blixen>
MIME-Version: 1.0
In-Reply-To: <339841b3b7ce6b2faf56bcaf9d92e298d878ef64.1680108414.git.johannes.thumshirn@wdc.com>
X-Originating-IP: [106.110.32.140]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNKsWRmVeSWpSXmKPExsWy7djP87pvLqqlGJz9q2+xbd1udovVd/vZ
 LE6ufsxm0dr+jcli77vZrBYXfjQyWexZNInJYuXqo0wWFz+2Mln87brHZPH06iygklvaFpce
 r2C32LP3JIvFvTX/WS3a5+9itDg0uZnJomt2K5vF7Ts/mC1O3JK2OL78L5vF7x9z2BzEPDav
 0PK4fLbUY9OqTjaPTZ8msXvsXvCZyWP3zQY2j97md2we7/ddZfNYv+Uqi8fm09UenzfJebQf
 6GYK4InisklJzcksSy3St0vgythycCtLwXyWik/vPzM2MO5i7mLk5JAQMJHYuec4YxcjF4eQ
 wApGiaZrv9kgnC+MEo9unYdyPjNKfDj9hgWm5d6kN0wQieVAVb9OMMFV/fiwih3C2cIocfja
 e0aQFhYBVYlfS5uAEhwcbAJaEo2d7CBhEQFjiSvfF7KA1DMLHGWVOPL6H1i9sECwRMenL2A2
 L9C6JSuuMUHYghInZz4BO4NZQEdiwe5PbCAzmQWkJZb/4wAJcwokSlycchrqOSWJhs1noK6u
 lTi15RbYoRIC/zglHn1dCVXkItHa9wmqSFji1fEt7BC2jMT/nfOZIOxqiac3fjNDNLcwSvTv
 XA+2WELAWqLvTA5EjaPEh+ermCDCfBI33gpCnMknMWnbdGaIMK9ER5sQRLWaxI6mrYwTGJVn
 IXlsFpLHZiE8toCReRWjeGppcW56arFRXmq5XnFibnFpXrpecn7uJkZg+jz97/iXHYzLX33U
 O8TIxMF4iFGCg1lJhLfQWDVFiDclsbIqtSg/vqg0J7X4EKM0B4uSOK+27clkIYH0xJLU7NTU
 gtQimCwTB6dUA9Pi3qdGz/s9tdgZs7dEvDzRoeu3cuJflcIf9xLN3mTPX8cj/7FtMWf84VOm
 W/efD3GNO5Z/98G7F5PerH7WciD4WlaD6/81qq13dyu4XzNYNfG6zdlKkTVslx/IvYvUvvk6
 VKPql75r/QPjmcfO5q2t3ffzT7b5pmntInvCrBI2nQnJvHE8eJXfN/60FEON8mWix5VYFJ9+
 Cfp+8qnK109Lrx2rmDhF5Fd8+/1zpjFGjJGXtZLyXZ+dn/drKu/rlokhX47Ht6xdmyg8id1r
 9c91sRxf5c/cEC/ynjildvOrUmXnrzrxC9Z8mLe+bNpNxQW7m/uO757mwXbvi/L6OcHHtI87
 bPlgJeP9tn5GQi+jqhJLcUaioRZzUXEiAMYrDlwOBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJKsWRmVeSWpSXmKPExsVy+t/xe7pvLqqlGKycLGCxbd1udovVd/vZ
 LE6ufsxm0dr+jcli77vZrBYXfjQyWexZNInJYuXqo0wWFz+2Mln87brHZPH06iygklvaFpce
 r2C32LP3JIvFvTX/WS3a5+9itDg0uZnJomt2K5vF7Ts/mC1O3JK2OL78L5vF7x9z2BzEPDav
 0PK4fLbUY9OqTjaPTZ8msXvsXvCZyWP3zQY2j97md2we7/ddZfNYv+Uqi8fm09UenzfJebQf
 6GYK4InSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQ
 y9hycCtLwXyWik/vPzM2MO5i7mLk5JAQMJG4N+kNUxcjF4eQwFJGiZndO5kgEjISn658ZIew
 hSX+XOtigyj6yChx4v4mdghnC6PExBefwKpYBFQlfi1tArI5ONgEtCQaO8HCIgLGEle+L2QB
 qWcWOMoq8evLRVaQhLBAsMStLzsYQWxeoDOWrLgGdcYURolFnyezQiQEJU7OfMICYjML6Egs
 2P2JDWQBs4C0xPJ/HCBhToFEiYtTTkO9oyTRsPkMC4RdK/H57zPGCYzCs5BMmoVk0iyESQsY
 mVcxiqSWFuem5xYb6RUn5haX5qXrJefnbmIEppFtx35u2cG48tVHvUOMTByMhxglOJiVRHgL
 jVVThHhTEiurUovy44tKc1KLDzGaAoNiIrOUaHI+MJHllcQbmhmYGpqYWRqYWpoZK4nzehZ0
 JAoJpCeWpGanphakFsH0MXFwSjUw5R9bcLzD4NIWde1u7fOP/SucVqQIqGQuy140dyW/WHqq
 LouScp+Uk/cjIYskyYc3meaefvvsxeqzCVukT/42ktXKLKvaGeKvGOnWpb30lf3GQmc5lquX
 6xidCvd/Ed26rWu15O9re02m27Hl/Jzt9fak9NRiwTvVnnm88wXCv7H4HL6+K0Q2Vuf/xLeb
 G66KfwsSzK+e2sApdtD15JSgMG5bwdPnb802a90RsdQo7mWV6NP3pQKzlJZfVltyOsb47fYf
 /vzvQhosjrW8Sywu81/1Kf5+xkPhzNl7vvfum/nqee4ClnvHJcKi0uqSPvy3FzYpehp2xcZ7
 V05ct/838c3ym1sf8H1L49i80iVGiaU4I9FQi7moOBEABax/UawDAAA=
X-CMS-MailID: 20230331122828eucas1p18e0bbbda45a6955f59fc82b29f42a8bb
X-Msg-Generator: CA
X-RootMTR: 20230331122828eucas1p18e0bbbda45a6955f59fc82b29f42a8bb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230331122828eucas1p18e0bbbda45a6955f59fc82b29f42a8bb
References: <cover.1680108414.git.johannes.thumshirn@wdc.com>
 <339841b3b7ce6b2faf56bcaf9d92e298d878ef64.1680108414.git.johannes.thumshirn@wdc.com>
 <CGME20230331122828eucas1p18e0bbbda45a6955f59fc82b29f42a8bb@eucas1p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Mon, 03 Apr 2023 09:22:43 +0000
Subject: Re: [Cluster-devel] [PATCH 13/19] zram: use __bio_add_page for
 adding single page to bio
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, cluster-devel@redhat.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Song Liu <song@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>, Mike Snitzer <snitzer@kernel.org>,
 jfs-discussion@lists.sourceforge.net, Matthew Wilcox <willy@infradead.org>,
 Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
 linux-mm@kvack.org, dm-devel@redhat.com, David Sterba <dsterba@suse.com>,
 Hannes Reinecke <hare@suse.de>, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Mar 29, 2023 at 10:05:59AM -0700, Johannes Thumshirn wrote:
> The zram writeback code uses bio_add_page() to add a page to a newly
> created bio. bio_add_page() can fail, but the return value is never
> checked.
> 
> Use __bio_add_page() as adding a single page to a newly created bio is
> guaranteed to succeed.
> 
> This brings us a step closer to marking bio_add_page() as __must_check.
> 
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Looks good,
Reviewed-by: Pankaj Raghav <p.raghav@samsung.com>

