Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE1F6CF833
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 02:24:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680135888;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fTKvc1YKyNV6oX/tfoeTTeDbLTAK+LlZa4iilBXXB9Q=;
	b=ELCquL8ocKr/CmaoBOuVv/F8y2D3rsLAOQb/Mfq5qUmWSnY7rs8NvcIDBzlcgxq8u0smMw
	zmHcadktkNA+Kg1NpLJJitnOgCCtNW/Scs/RDHFVd3m0xTC0LLgNJNFmwLb4iyy3EdDEFE
	Ht1jZiGXoOU1nJpuxoTFfDkwCW0gGxo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-kIWogE3tPpOya3JS5h1ALg-1; Wed, 29 Mar 2023 20:24:45 -0400
X-MC-Unique: kIWogE3tPpOya3JS5h1ALg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0742C857FB5;
	Thu, 30 Mar 2023 00:24:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA6291121330;
	Thu, 30 Mar 2023 00:24:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BD49A194658F;
	Thu, 30 Mar 2023 00:24:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8672B194658C for <cluster-devel@listman.corp.redhat.com>;
 Thu, 30 Mar 2023 00:24:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6624640BC798; Thu, 30 Mar 2023 00:24:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E42740BC797
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 00:24:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 418208828C0
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 00:24:43 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-CDGJRv9pNQe-I8xxUGgipQ-1; Wed, 29 Mar 2023 20:24:41 -0400
X-MC-Unique: CDGJRv9pNQe-I8xxUGgipQ-1
X-IronPort-AV: E=Sophos;i="5.98,301,1673884800"; d="scan'208";a="225116481"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 08:24:38 +0800
IronPort-SDR: /rwffl/nVq9jJGLnPY5y0oR8HftFeIAL4sctfmKZ19rDf40cK3DE/BsAU1VcV/CzgVdmPe/eLl
 FwPt+arV5Q3L5hx7wDDmLEMOkHAF3y5GvGpfwbobcQb2zfMu9HLLvaQ54VOhuPC+6Deop7z2wj
 kkDT9VVPZ18hiWDNSeeq/Exeueh+lUr9kRmBqLKL4OoDnxSEHpxoiNoWpEMouIOJ1uOUrB2KOg
 pHwgcEql3GFqH7/f/RR8EFx3C636G50pivDyUMuWY2QDTmWxkzPp9iJ8Cog5WhZm56vJTCJ83X
 1hE=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 16:40:46 -0700
IronPort-SDR: SJVBnufMcTN0WoNuKku0pzDye08Zy//TJM0ey3QZLWwhE2jWPy/3bXBdK2f5nu5eZeAzK9GhzI
 DDwCk0m5USooVJyNBSTub1TD1a9OMgwxXa4KWVmQUrdFoL6+30yzzIszCr/vVFm31gE4MsGHHN
 n64TiieMt1JvpxEs7FCPdoGhLcssI4BgGvYD5V5bhiYJnK3SwKWpgFtSFZkDVsDCr9Rze48bD5
 0jPZtniT6MiMktPbjkxt92xtt81tgBVy4k3ljedE9uaYiJc/G2u8XzjMe0FGmKgc5uuZZOWqdz
 NLg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 17:24:38 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pn41J1BRyz1RtVw
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 17:24:36 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id yeGtg8yjbM94 for <cluster-devel@redhat.com>;
 Wed, 29 Mar 2023 17:24:34 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pn41C5RmQz1RtVm;
 Wed, 29 Mar 2023 17:24:31 -0700 (PDT)
Message-ID: <b19696d3-54bb-d997-5e56-aa5fd58b469f@opensource.wdc.com>
Date: Thu, 30 Mar 2023 09:24:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Yang Shi <shy828301@gmail.com>
References: <cover.1680108414.git.johannes.thumshirn@wdc.com>
 <beea645603eccbb045ad9bb777e05a085b91808a.1680108414.git.johannes.thumshirn@wdc.com>
 <3a0f0c92-63cb-3624-c2fe-049a76d1a64a@opensource.wdc.com>
 <CAHbLzkoRdTTbnfz3RyLQAeNJBOEVNGL2WLgRSE2eQ4nR8sRe2g@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAHbLzkoRdTTbnfz3RyLQAeNJBOEVNGL2WLgRSE2eQ4nR8sRe2g@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH 18/19] dm-crypt: check if adding pages
 to clone bio fails
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
 jfs-discussion@lists.sourceforge.net, cluster-devel@redhat.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Song Liu <song@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Mike Snitzer <snitzer@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
 linux-mm@kvack.org, dm-devel@redhat.com, David Sterba <dsterba@suse.com>,
 Hannes Reinecke <hare@suse.de>, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: opensource.wdc.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 3/30/23 09:17, Yang Shi wrote:
> On Wed, Mar 29, 2023 at 4:49=E2=80=AFPM Damien Le Moal
> <damien.lemoal@opensource.wdc.com> wrote:
>>
>> On 3/30/23 02:06, Johannes Thumshirn wrote:
>>> Check if adding pages to clone bio fails and if bail out.
>>
>> Nope. The code retries with direct reclaim until it succeeds. Which is v=
ery
>> suspicious...
>=20
> It is not related to bio_add_page() failure. It is used to avoid a
> race condition when two processes are depleting the mempool
> simultaneously.
>=20
> IIUC I don't think page merge may happen for dm-crypt, so is
> __bio_add_page() good enough? I'm working on this code too, using
> __bio_add_page() would make my patch easier.

If the BIO was allocated with enough bvecs, we could use that function. But=
 page
merging reduces overhead, so if it can happen, let's use it.

>=20
>>
>>>
>>> This way we can mark bio_add_pages as __must_check.
>>>
>>> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
>>
>> With the commit message fixed,
>>
>> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
>>
>>
>> --
>> Damien Le Moal
>> Western Digital Research
>>
>>

--=20
Damien Le Moal
Western Digital Research

