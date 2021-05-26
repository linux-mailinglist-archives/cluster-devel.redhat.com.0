Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 00480391A09
	for <lists+cluster-devel@lfdr.de>; Wed, 26 May 2021 16:22:02 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-GLs3S3hwMbCPESsHjYDw3g-1; Wed, 26 May 2021 10:21:55 -0400
X-MC-Unique: GLs3S3hwMbCPESsHjYDw3g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D75E1E7B40;
	Wed, 26 May 2021 14:21:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF574610DF;
	Wed, 26 May 2021 14:21:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5CBD55345;
	Wed, 26 May 2021 14:21:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14QELoZO029608 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 May 2021 10:21:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BEFE51037B5; Wed, 26 May 2021 14:21:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAC16FED25
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 14:21:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57EA79124C1
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 14:21:47 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-73-F3KwzlqnMJu3ewSfqLbz6w-1; Wed, 26 May 2021 10:21:44 -0400
X-MC-Unique: F3KwzlqnMJu3ewSfqLbz6w-1
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
	by youngberry.canonical.com with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
	(envelope-from <colin.king@canonical.com>)
	id 1lluPn-0007xi-2R; Wed, 26 May 2021 14:21:43 +0000
To: Alexander Ahring Oder Aring <aahringo@redhat.com>
References: <20210526134039.3448305-1-colin.king@canonical.com>
	<CAK-6q+jXZ2MGUw3QPKHwoNDMLdTookO7rq9LpGNx=ZGAn1pqOQ@mail.gmail.com>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <88c69c56-7296-01a7-e283-26811a52243e@canonical.com>
Date: Wed, 26 May 2021 15:21:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAK-6q+jXZ2MGUw3QPKHwoNDMLdTookO7rq9LpGNx=ZGAn1pqOQ@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26/05/2021 15:19, Alexander Ahring Oder Aring wrote:
> Hi,
> 
> On Wed, May 26, 2021 at 9:40 AM Colin King <colin.king@canonical.com> wrote:
>>
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
>>         if (rc_in->rc_id == 0xFFFFFFFF) {
>>                 log_error(ls, "receive_rcom_lookup dump from %d", nodeid);
>>                 dlm_dump_rsb_name(ls, rc_in->rc_buf, len);
>> +               kfree(mh);
>>                 return;
> 
> This seems to be a bigger issue, we cannot revert the buffer
> allocation with a kfree, we cannot revert it at all. We should avoid
> any error handling between create_rcom() and send_rcom(). In general
> between get_buffer/commit_buffer.
> 
> I don't see a problem with moving the error handling before
> create_rcom(). That should fix the issue.

Good point, I'll send a V2 in a while

> 
> - Alex
> 

