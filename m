Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AE500720214
	for <lists+cluster-devel@lfdr.de>; Fri,  2 Jun 2023 14:31:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685709059;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5KczTQ2AZCgTU2CpSNceVMnYBZTGZq4bWaDOnIranDc=;
	b=Vf6rsGxcfgMun89b5awDMC7SRTcc0gijzerS9JuWc2EzQvvD1xCcAeC0F78mZJ+Un35vfD
	ElKtbcQZla5PgDNfyKRn3USmdEli7NROT6RAcem//MYnIsyyIA6txzD+a+mxebwaeb3Lsd
	Pk8ExjT6pQLPoya/6pMXOojQo1HplG0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-2x7nat_YOvG9TwRYuQL2_Q-1; Fri, 02 Jun 2023 08:30:55 -0400
X-MC-Unique: 2x7nat_YOvG9TwRYuQL2_Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37B1A2A2AD5B;
	Fri,  2 Jun 2023 12:30:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E88E62166B28;
	Fri,  2 Jun 2023 12:30:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 734F819465A2;
	Fri,  2 Jun 2023 12:30:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 786E7194658C for <cluster-devel@listman.corp.redhat.com>;
 Fri,  2 Jun 2023 12:30:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 561CE2166B27; Fri,  2 Jun 2023 12:30:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D6972166B25
 for <cluster-devel@redhat.com>; Fri,  2 Jun 2023 12:30:51 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 300631C04186
 for <cluster-devel@redhat.com>; Fri,  2 Jun 2023 12:30:51 +0000 (UTC)
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-T7WEAGzXNc6opdr64dzH2A-1; Fri, 02 Jun 2023 08:30:50 -0400
X-MC-Unique: T7WEAGzXNc6opdr64dzH2A-1
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-783bc0aeda5so569744241.1
 for <cluster-devel@redhat.com>; Fri, 02 Jun 2023 05:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685709049; x=1688301049;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5KczTQ2AZCgTU2CpSNceVMnYBZTGZq4bWaDOnIranDc=;
 b=PcSROf9MU5EZBUiU0aTIRbRvAgx65TodLJVS98VsZDL5StVmgevHlXgAE0XaEOAOAQ
 gdXomG5r8vfy8hSEmN/5c8KNlyWQvkggaHlK7It9CLRdvmLCwhWNaHnNrFQjRGmSTJ86
 H2sfld5QYYgILpCTp+U5rfWc3+K9MEz1AOY8DsFEmEtBaHkIihdJF975A55QjpMX9Jkc
 jJyAghTdQznkS/4AvgWt+4XCE0MmtyJzcFS+aMX/HVr3KhQ6cdeQsybxEOXfslkWhwFj
 SsIOMc/YuJKzqzKD8urrJWPi6LRBIZDxtRBuiVjUAgo1XQG6e/1WmBMPdytHOne9w5vx
 joSA==
X-Gm-Message-State: AC+VfDwZRNhi4tZLny+Zo12/SktyuXSI9hgwblZdnUWx4sFrCNjNTFVo
 I8qYcLxYyxRtOwDd1Y2CsVLpTrx/DRowS/E2ip4N5W3khxOGXJXZ4ZiiEK96bgnEEs0Wuu05upI
 ZXhyoeAvKIp/B3K5z8tdljw==
X-Received: by 2002:a67:f1d2:0:b0:43b:1893:e41d with SMTP id
 v18-20020a67f1d2000000b0043b1893e41dmr1719789vsm.25.1685709049354; 
 Fri, 02 Jun 2023 05:30:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6SgTq0KtUBm5AHpuTfvZ4raq0BhwLIXgG5+TFLPzO9W++o0g3RAEJ2BxE7FRGtwANDTED/xg==
X-Received: by 2002:a67:f1d2:0:b0:43b:1893:e41d with SMTP id
 v18-20020a67f1d2000000b0043b1893e41dmr1719776vsm.25.1685709049045; 
 Fri, 02 Jun 2023 05:30:49 -0700 (PDT)
Received: from [172.16.0.7] ([209.73.90.46]) by smtp.gmail.com with ESMTPSA id
 u5-20020a0cc485000000b006263c531f61sm761973qvi.24.2023.06.02.05.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 05:30:48 -0700 (PDT)
Message-ID: <4530554c-c2b3-f93b-6c2c-c411e62d1e45@redhat.com>
Date: Fri, 2 Jun 2023 07:30:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
References: <20230517032442.1135379-1-willy@infradead.org>
From: Bob Peterson <rpeterso@redhat.com>
In-Reply-To: <20230517032442.1135379-1-willy@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/23 10:24 PM, Matthew Wilcox (Oracle) wrote:
> This kind of started off as a gfs2 patch series, then became entwined
> with buffer heads once I realised that gfs2 was the only remaining
> caller of __block_write_full_page().  For those not in the gfs2 world,
> the big point of this series is that block_write_full_page() should now
> handle large folios correctly.
> 
> It probably makes most sense to take this through Andrew's tree, once
> enough people have signed off on it?
> 
> Matthew Wilcox (Oracle) (6):
>    gfs2: Use a folio inside gfs2_jdata_writepage()
>    gfs2: Pass a folio to __gfs2_jdata_write_folio()
>    gfs2: Convert gfs2_write_jdata_page() to gfs2_write_jdata_folio()
>    buffer: Convert __block_write_full_page() to
>      __block_write_full_folio()
>    gfs2: Support ludicrously large folios in gfs2_trans_add_databufs()
>    buffer: Make block_write_full_page() handle large folios correctly
> 
>   fs/buffer.c                 | 75 ++++++++++++++++++-------------------
>   fs/gfs2/aops.c              | 66 ++++++++++++++++----------------
>   fs/gfs2/aops.h              |  2 +-
>   fs/ntfs/aops.c              |  2 +-
>   fs/reiserfs/inode.c         |  2 +-
>   include/linux/buffer_head.h |  2 +-
>   6 files changed, 75 insertions(+), 74 deletions(-)
> 
Hi Willy,

I did some fundamental testing with this patch set in a five-node 
cluster, as well as xfstests, and it seemed to work properly. The 
testing was somewhat limited, but it passed basic cluster coherency 
testing. Sorry it took so long.

If you want you can add:
Tested-by: Bob Peterson <rpeterso@redhat.com>
Reviewed-by: Bob Peterson <rpeterso@redhat.com>

Regards,

Bob Peterson

