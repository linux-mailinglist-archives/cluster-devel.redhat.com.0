Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 34656720333
	for <lists+cluster-devel@lfdr.de>; Fri,  2 Jun 2023 15:25:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685712349;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S1kpezRB7CtK3CiBr2GgVtaRFOHZgMOnCsOR8MuQTeU=;
	b=d+JLfAzXbSkXMd9NBmdW+aqpyB+Z/dXSUwWX8RHPDXaT8RRg939VovPLLXX0T0v6Rvlcss
	lz9o3NJDOl6t0FMSQrMNxJkSpWFWbOQkluTsn59JMsaJMkI2IdRgh1D/WQMJ9x+oLDM7P/
	YBSUcIzx86Gju4omBH+dmG27PUkiFcU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-BUAF9q7qOOmDkBc99DWv6w-1; Fri, 02 Jun 2023 09:25:46 -0400
X-MC-Unique: BUAF9q7qOOmDkBc99DWv6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 365042932481;
	Fri,  2 Jun 2023 13:25:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC2B31410F25;
	Fri,  2 Jun 2023 13:25:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8DA2E19465A2;
	Fri,  2 Jun 2023 13:25:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A9D5F194658C for <cluster-devel@listman.corp.redhat.com>;
 Fri,  2 Jun 2023 13:25:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 83B0C8162; Fri,  2 Jun 2023 13:25:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C41A9E63
 for <cluster-devel@redhat.com>; Fri,  2 Jun 2023 13:25:43 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CF322932481
 for <cluster-devel@redhat.com>; Fri,  2 Jun 2023 13:25:43 +0000 (UTC)
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-S0NYaQbSO26X_gjblsRiOw-1; Fri, 02 Jun 2023 09:25:42 -0400
X-MC-Unique: S0NYaQbSO26X_gjblsRiOw-1
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-45e18c5ed48so395109e0c.2
 for <cluster-devel@redhat.com>; Fri, 02 Jun 2023 06:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685712341; x=1688304341;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S1kpezRB7CtK3CiBr2GgVtaRFOHZgMOnCsOR8MuQTeU=;
 b=MRygcg0GcL072usKmqrOpnDBiwAtxsqV93b4wKjS0hOeH3vwgO5SWeYaHBfnDD8aQj
 uF0RkWrjZhVrLVlZZIjsX5E6g3itXIW4Ipatt5vivrbyQGKfg8i+BHf1Qnl/bRzOlGc2
 15jndbQTGLN0yqT7J6MqwSlNgPccvKZiOil1vrn5i+aXJqL9lweqaT9NYysuF4Nwj2Hr
 l4eAq5DVNrMLf3yHdwgrGmnoeyagsSAxBYf+5bPeelzjvGw87w2jazZpD+Cg4tamI637
 apvv8U1QmBRcVY0cpbVxBEUBDMveyyhzp2sfq5zuLUZS1k/s9u+pDDNsWiSgCfiEhRYi
 dmYQ==
X-Gm-Message-State: AC+VfDz3QTGrKDSY2X+ZJAvXczfnU8VHN9wMVNKLAs9kplsbLfPsX/ym
 ZM3dApelBOzBYx7szqd5enQG0d1xMhRyN9eCbeUM8TZOZ0wy9O6GAIe/Phlty6IU8PuCZD9yu/I
 kPFCS3QqcoZvvo00ltRCl9Q==
X-Received: by 2002:a1f:3f83:0:b0:456:f9e5:5bcf with SMTP id
 m125-20020a1f3f83000000b00456f9e55bcfmr2232692vka.6.1685712341519; 
 Fri, 02 Jun 2023 06:25:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ49e2Sk8d8XLQjjuDge6fiC6bO3G8/IDlZdt/o9nnTP0LIwiJHPdTe1xkT9Iwb8yNZhTpYwsw==
X-Received: by 2002:a1f:3f83:0:b0:456:f9e5:5bcf with SMTP id
 m125-20020a1f3f83000000b00456f9e55bcfmr2232679vka.6.1685712341281; 
 Fri, 02 Jun 2023 06:25:41 -0700 (PDT)
Received: from [172.16.0.7] ([209.73.90.46]) by smtp.gmail.com with ESMTPSA id
 pc1-20020a05620a840100b0075b196ae392sm614218qkn.104.2023.06.02.06.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 06:25:40 -0700 (PDT)
Message-ID: <16d964a4-755f-53c8-b7bf-43584acdd380@redhat.com>
Date: Fri, 2 Jun 2023 08:25:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Bob Peterson <rpeterso@redhat.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
References: <20230517032442.1135379-1-willy@infradead.org>
 <4530554c-c2b3-f93b-6c2c-c411e62d1e45@redhat.com>
In-Reply-To: <4530554c-c2b3-f93b-6c2c-c411e62d1e45@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH 0/6] gfs2/buffer folio changes
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
Cc: cluster-devel@redhat.com, Hannes Reinecke <hare@suse.com>,
 Luis Chamberlain <mcgrof@kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/2/23 7:30 AM, Bob Peterson wrote:
> On 5/16/23 10:24 PM, Matthew Wilcox (Oracle) wrote:
>> This kind of started off as a gfs2 patch series, then became entwined
>> with buffer heads once I realised that gfs2 was the only remaining
>> caller of __block_write_full_page().  For those not in the gfs2 world,
>> the big point of this series is that block_write_full_page() should now
>> handle large folios correctly.
>>
>> It probably makes most sense to take this through Andrew's tree, once
>> enough people have signed off on it?
> Hi Willy,
> 
> I did some fundamental testing with this patch set in a five-node 
> cluster, as well as xfstests, and it seemed to work properly. The 
> testing was somewhat limited, but it passed basic cluster coherency 
> testing. Sorry it took so long.
> 
> If you want you can add:
> Tested-by: Bob Peterson <rpeterso@redhat.com>
> Reviewed-by: Bob Peterson <rpeterso@redhat.com>
> 
> Regards,
> 
> Bob Peterson

I was talking with Andreas G and he still has some concerns, so don't 
push this to a repo quite yet.

Regards,

Bob Peterson


