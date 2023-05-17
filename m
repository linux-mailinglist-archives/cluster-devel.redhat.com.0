Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF5E707069
	for <lists+cluster-devel@lfdr.de>; Wed, 17 May 2023 20:06:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684346811;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JPAKEMmoW/hN8niZpR0qHJlcpgA9MC/akmM/6a2jgQg=;
	b=MfQaVQon7Usr5QbvYPVfHPibLw8b/5q1B6VK1dpEcGFOfeY38fDrenXyE4X1qX4q+WxId3
	h77mS+ZxB0q3DvlyfWfVKnxkDqPHmpVhBDhmcBTWWjKd9zJywsjwpRhlo3WqC4xDxgxftc
	rDmJwChBsAAT52bf1TTbWWElwW0/MKQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-d0l4WYOzO26IIOl7yDe9vQ-1; Wed, 17 May 2023 14:06:46 -0400
X-MC-Unique: d0l4WYOzO26IIOl7yDe9vQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 900D881DB6C;
	Wed, 17 May 2023 18:06:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 966EB2026D25;
	Wed, 17 May 2023 18:06:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C809219465B2;
	Wed, 17 May 2023 18:06:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 327EF19465A4 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 17 May 2023 18:06:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 23264C16024; Wed, 17 May 2023 18:06:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B213C15BA0
 for <cluster-devel@redhat.com>; Wed, 17 May 2023 18:06:43 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F03282A59565
 for <cluster-devel@redhat.com>; Wed, 17 May 2023 18:06:42 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-v3RUj6chM2mEJLGCFRVxPw-1; Wed, 17 May 2023 14:06:41 -0400
X-MC-Unique: v3RUj6chM2mEJLGCFRVxPw-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7576f01e6e1so80693785a.1
 for <cluster-devel@redhat.com>; Wed, 17 May 2023 11:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684346801; x=1686938801;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JPAKEMmoW/hN8niZpR0qHJlcpgA9MC/akmM/6a2jgQg=;
 b=FgmqGpYWutGY0MAlo1SK8tMKDe2Rrh321oVJfQM54xFk1kMYE+i1+J4t0H0afUpM0f
 FLoGJpT2KSc51GkYxoVC35MJtFtldsSXyn4RCL5LhSquGp0zyDQNFG5y0ldIhCxi7YkW
 JBItBs3PehxRMihZvzZSajrGTpXkIXaIRUUwR54OApnsR29hcB57Eb8Os4oANZ1BXLWa
 nht3C4k7vGzLzMJxHPOrubq9WpSSAiVJdV+wt/9Y7I6xLaQLwhgmTzqWgKWB0NfjQyBe
 fZFvmyy19hjNdRhH86dnDfyBxGo7FLFQ4kfVM8YfARhr7n/rWTvqgTx9bE9hGdNptlsT
 TdNw==
X-Gm-Message-State: AC+VfDysAQLNzPMp75FitC2Bpho1hLFdCFwzy3Fd8rG2v+tWuWLRPt1E
 bzgGNknBnnGllG9VjqBvP+Gs3CfewvEQTRy/1bgbVBfNqroEMh5Mma509v2uwyjrLZ2M0y18lOt
 /+PrJQysNCWrWBhRKJgMcfA==
X-Received: by 2002:ac8:7f88:0:b0:3f5:1bf2:8b90 with SMTP id
 z8-20020ac87f88000000b003f51bf28b90mr823703qtj.13.1684346801030; 
 Wed, 17 May 2023 11:06:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7bKUBNvkUgo07NzXqdvUsP1kW6RU9BYMt7BII3OsWP+fRx8VumCBPBNl0Tjnzu4rkCFMPrTw==
X-Received: by 2002:ac8:7f88:0:b0:3f5:1bf2:8b90 with SMTP id
 z8-20020ac87f88000000b003f51bf28b90mr823675qtj.13.1684346800793; 
 Wed, 17 May 2023 11:06:40 -0700 (PDT)
Received: from [172.16.0.7] ([209.73.90.46]) by smtp.gmail.com with ESMTPSA id
 v11-20020ae9e30b000000b0074636e35405sm790856qkf.65.2023.05.17.11.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 11:06:40 -0700 (PDT)
Message-ID: <4b01c34d-5bdc-e72a-33f1-956864236ed4@redhat.com>
Date: Wed, 17 May 2023 13:06:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
References: <20230517032442.1135379-1-willy@infradead.org>
From: Bob Peterson <rpeterso@redhat.com>
In-Reply-To: <20230517032442.1135379-1-willy@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Hi Matthew,

I recently started looking into doing this, too, so this is apropos.
I'll give it a careful review and some testing. The jdata stuff in gfs2 
is very touchy, but this looks like a step in the right direction.
I'll let you know how it fares.

Regards,

Bob Peterson

