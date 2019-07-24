Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7948D72B0F
	for <lists+cluster-devel@lfdr.de>; Wed, 24 Jul 2019 11:05:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C5973E2CB;
	Wed, 24 Jul 2019 09:05:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27D9A1024892;
	Wed, 24 Jul 2019 09:05:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5276841F63;
	Wed, 24 Jul 2019 09:05:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6O950wD030204 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jul 2019 05:05:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F6AB1001B20; Wed, 24 Jul 2019 09:05:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2F4D1001B28;
	Wed, 24 Jul 2019 09:04:56 +0000 (UTC)
To: Jia-Ju Bai <baijiaju1990@gmail.com>, rpeterso@redhat.com,
	agruenba@redhat.com
References: <8d270882-54da-365e-1be7-a291a5178b1e@gmail.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <cd7c0bb4-53d2-8a67-0719-c26d043a31fc@redhat.com>
Date: Wed, 24 Jul 2019 10:04:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8d270882-54da-365e-1be7-a291a5178b1e@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: 8bit
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6O950wD030204
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [BUG] fs: gfs2: possible null-pointer
 dereferences in gfs2_rgrp_bh_get()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Wed, 24 Jul 2019 09:05:05 +0000 (UTC)

Hi,

On 24/07/2019 09:50, Jia-Ju Bai wrote:
> In gfs2_rgrp_bh_get, there is an if statement on line 1191 to check 
> whether "rgd->rd_bits[0].bi_bh" is NULL.

That is how we detect whether the rgrp has already been read in, so the 
function is skipped in the case that we've already read in the rgrp.


> When "rgd->rd_bits[0].bi_bh" is NULL, it is used on line 1216:
>     gfs2_rgrp_in(rgd, (rgd->rd_bits[0].bi_bh)->b_data);

No it isn't. See line 1196 where bi_bh is set, and where we also bail 
out (line 1198) in case it has not been set.


> and on line 1225:
>     gfs2_rgrp_ondisk2lvb(..., rgd->rd_bits[0].bi_bh->b_data);
> and on line 1228:
>     if (!gfs2_rgrp_lvb_valid(rgd))
>
> Note that in gfs2_rgrp_lvb_valid(rgd), there is a statement on line 1114:
>     struct gfs2_rgrp *str = (struct gfs2_rgrp 
> *)rgd->rd_bits[0].bi_bh->b_data;
>
> Thus, possible null-pointer dereferences may occur.
>
> These bugs are found by a static analysis tool STCheck written by us.
> I do not know how to correctly fix these bugs, so I only report bugs.
>
>
> Best wishes,
> Jia-Ju Bai
>
So I'm not seeing how there can be a NULL deref in those later lines. I 
think this is another false positive,

Steve.




