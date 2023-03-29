Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 388056CF79E
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 01:45:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680133506;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H9Wnxri7/pl0aVVsp6O45Pp8b0Po4MrKz/j+WyI/G60=;
	b=OFCgplNA3EiWa0X90Kw/GmiTYNbAhEBx/5Dzry4W7yGykNsZmP8B+ev5xXbJfPpjjlivtQ
	+FhPqkzJXmVGLAqsob6ke11L0uBbw5bUtveGbqhzpW9n0JYam2JA7FiB3lCYCoqmyd2EnS
	4BdCPjcbt+jQq8sdLXleSB20ZQxhzXE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-X-pSsItXNiuwXpjHmK2nLA-1; Wed, 29 Mar 2023 19:45:03 -0400
X-MC-Unique: X-pSsItXNiuwXpjHmK2nLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01D513C0C8AF;
	Wed, 29 Mar 2023 23:45:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC2CD2166B33;
	Wed, 29 Mar 2023 23:45:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 78EAC194658F;
	Wed, 29 Mar 2023 23:45:01 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 008971946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 23:45:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E5AAC40BC798; Wed, 29 Mar 2023 23:45:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE56240BC797
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:45:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C38D485A5A3
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:45:00 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-Li-BcZjRN_yCxGqd8DsX5w-3; Wed, 29 Mar 2023 19:44:56 -0400
X-MC-Unique: Li-BcZjRN_yCxGqd8DsX5w-3
X-IronPort-AV: E=Sophos;i="5.98,301,1673884800"; d="scan'208";a="225114142"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 07:44:53 +0800
IronPort-SDR: BSxH/MINC9ipJ4NrqzAYo0DFFepWNOrKw4fKaXeD760urkxshb0v7Zg/4JeaHloYqxigUYMmuI
 oo6lwXwc0zzlO3tJiouBhKYeGVC3lcPfyGM1hUsUOPDG/Gv6vXBahvqHTwTbL9ah/uALP1WrO2
 FmyJauzdS7glugSKERa25eNW8fh7MnT26PROnRZGJf0vYUCP3Q4T2Pzx2mWiKSO/xWejJDf9hX
 6AvAt4pcICoKb6vKI+8qj86j8QcgupNku4Vz6J9agv/uEtjaun2v0DeKPQAYf+XVCHOONocX7F
 4So=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 16:01:02 -0700
IronPort-SDR: ycYkL1CqSoHBPUwnhjjtlENQVXoBMt39utJFK+vL2WPOu/ugnaMyVpSqw2xAZWAbEk9G/mDR6O
 kG1lvxFImSPEhD1fgemDLaAHPlzrl/jC9w0eRTehfLgNg1UgCssi2rDFi7pHl04fFmP4I8rjYS
 j+bgHGcQOyPxaOO25p0Ay8FKLQFfIi012m3/pxYLnsaLobhKXwpKrGKHo+W42LZLOu1cx+DBHy
 /Dttj8uEkmpQtQ+xp5jyLmunnPBsjGDtCyk/DFNuxjLg7PJHSYo3KsHF7FmCxHhX7iWZ+/nvi9
 zO4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 16:44:54 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pn37T0QbTz1RtVx
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 16:44:52 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id gQZeM7J0ZAxq for <cluster-devel@redhat.com>;
 Wed, 29 Mar 2023 16:44:52 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pn37P0nXXz1RtVm;
 Wed, 29 Mar 2023 16:44:48 -0700 (PDT)
Message-ID: <7441afa8-3e60-79cf-66c7-4ddb692c1bcd@opensource.wdc.com>
Date: Thu, 30 Mar 2023 08:44:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Jens Axboe <axboe@kernel.dk>
References: <cover.1680108414.git.johannes.thumshirn@wdc.com>
 <e2f96e539befa4f9d57f19ff1fc26cfc0d109435.1680108414.git.johannes.thumshirn@wdc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <e2f96e539befa4f9d57f19ff1fc26cfc0d109435.1680108414.git.johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH 17/19] md: raid1: check if adding pages
 to resync bio fails
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
Cc: linux-raid@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
 cluster-devel@redhat.com, Chaitanya Kulkarni <kch@nvidia.com>,
 Song Liu <song@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 Mike Snitzer <snitzer@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
 linux-mm@kvack.org, dm-devel@redhat.com, David Sterba <dsterba@suse.com>,
 Hannes Reinecke <hare@suse.de>, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: opensource.wdc.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/30/23 02:06, Johannes Thumshirn wrote:
> Check if adding pages to resync bio fails and if bail out.
> 
> As the comment above suggests this cannot happen, WARN if it actually
> happens.
> 
> This way we can mark bio_add_pages as __must_check.
> 
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> ---
>  drivers/md/raid1-10.c |  7 ++++++-
>  drivers/md/raid10.c   | 12 ++++++++++--
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/md/raid1-10.c b/drivers/md/raid1-10.c
> index e61f6cad4e08..c21b6c168751 100644
> --- a/drivers/md/raid1-10.c
> +++ b/drivers/md/raid1-10.c
> @@ -105,7 +105,12 @@ static void md_bio_reset_resync_pages(struct bio *bio, struct resync_pages *rp,
>  		 * won't fail because the vec table is big
>  		 * enough to hold all these pages
>  		 */
> -		bio_add_page(bio, page, len, 0);
> +		if (WARN_ON(!bio_add_page(bio, page, len, 0))) {

Not sure we really need the WARN_ON here...
Nevertheless,

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>


> +			bio->bi_status = BLK_STS_RESOURCE;
> +			bio_endio(bio);
> +			return;
> +		}
> +
>  		size -= len;
>  	} while (idx++ < RESYNC_PAGES && size > 0);
>  }
> diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
> index 6c66357f92f5..5682dba52fd3 100644
> --- a/drivers/md/raid10.c
> +++ b/drivers/md/raid10.c
> @@ -3808,7 +3808,11 @@ static sector_t raid10_sync_request(struct mddev *mddev, sector_t sector_nr,
>  			 * won't fail because the vec table is big enough
>  			 * to hold all these pages
>  			 */
> -			bio_add_page(bio, page, len, 0);
> +			if (WARN_ON(!bio_add_page(bio, page, len, 0))) {
> +				bio->bi_status = BLK_STS_RESOURCE;
> +				bio_endio(bio);
> +				goto giveup;
> +			}
>  		}
>  		nr_sectors += len>>9;
>  		sector_nr += len>>9;
> @@ -4989,7 +4993,11 @@ static sector_t reshape_request(struct mddev *mddev, sector_t sector_nr,
>  			 * won't fail because the vec table is big enough
>  			 * to hold all these pages
>  			 */
> -			bio_add_page(bio, page, len, 0);
> +			if (WARN_ON(!bio_add_page(bio, page, len, 0))) {
> +				bio->bi_status = BLK_STS_RESOURCE;
> +				bio_endio(bio);
> +				return sectors_done; /* XXX: is this correct? */
> +			}
>  		}
>  		sector_nr += len >> 9;
>  		nr_sectors += len >> 9;

-- 
Damien Le Moal
Western Digital Research

