Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 72187391B4C
	for <lists+cluster-devel@lfdr.de>; Wed, 26 May 2021 17:11:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-1SmzxAqPOlCoyainjRl2ZA-1; Wed, 26 May 2021 11:11:26 -0400
X-MC-Unique: 1SmzxAqPOlCoyainjRl2ZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EF416D4F6;
	Wed, 26 May 2021 15:11:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52EEB5C22A;
	Wed, 26 May 2021 15:11:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A11F1800BB8;
	Wed, 26 May 2021 15:11:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14QFBLFt032205 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 May 2021 11:11:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8C1F9205348D; Wed, 26 May 2021 15:11:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34DB121DE6E6
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 15:11:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13C541871CC7
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 15:11:14 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-180-I6A4nyzSM-GDbQVnzcTMbQ-1; Wed, 26 May 2021 11:11:09 -0400
X-MC-Unique: I6A4nyzSM-GDbQVnzcTMbQ-1
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
	by youngberry.canonical.com with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
	(envelope-from <colin.king@canonical.com>)
	id 1llvBb-00034X-Bk; Wed, 26 May 2021 15:11:07 +0000
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20210526134039.3448305-1-colin.king@canonical.com>
	<20210526150133.GQ1955@kadam>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <c5ea0085-969a-339f-fd92-6724cb1d928e@canonical.com>
Date: Wed, 26 May 2021 16:11:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526150133.GQ1955@kadam>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH][next] fs: dlm: Fix memory leak of
	object mh
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26/05/2021 16:01, Dan Carpenter wrote:
> On Wed, May 26, 2021 at 02:40:39PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There is an error return path that is not kfree'ing mh after
>> it has been successfully allocates.  Fix this by free'ing it.
>>
>> Addresses-Coverity: ("Resource leak")
>> Fixes: a070a91cf140 ("fs: dlm: add more midcomms hooks")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  fs/dlm/rcom.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
>> index 085f21966c72..19298edc1573 100644
>> --- a/fs/dlm/rcom.c
>> +++ b/fs/dlm/rcom.c
>> @@ -393,6 +393,7 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
>>  	if (rc_in->rc_id == 0xFFFFFFFF) {
>>  		log_error(ls, "receive_rcom_lookup dump from %d", nodeid);
>>  		dlm_dump_rsb_name(ls, rc_in->rc_buf, len);
>> +		kfree(mh);
> 
> Am I looking at the same code as you?  (I often am not able to review
> your patches because you're doing development on stuff that hasn't hit
> linux-next).  Anyway, to me this doesn't seem like the correct fix at
> all.  There are some other things to free and the "mh" pointer is on
> a bunch of lists so it leads to use after frees.

I've send a V2. It was indeed a brown-paper-bag bad fix.

> 
> regards,
> dan carpenter
> 

