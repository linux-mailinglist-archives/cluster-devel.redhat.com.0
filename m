Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F5863611C
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Nov 2022 15:08:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669212479;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=SNHhmVfjWC62dBHkktz2lKH8qamIk/lczkSRmxlEqVI=;
	b=RaEGV8C2WR8iN1JSxCzUiCeX5y/25h0EKwPvGp8nfZFAooUkhvffC8tTQxuy4z8xgLdXpe
	zFDAPL7EyTMrndBN6p85xwzbcKjujb/uEvzlPK+1BKhksM/yBEzyqnYceu9zKrMaMqUGIx
	6W/wQD4Rggi0OOpuf7M837Ey6Wn5ZpQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-TsLTPS_8NB6prchlhk73bw-1; Wed, 23 Nov 2022 09:07:56 -0500
X-MC-Unique: TsLTPS_8NB6prchlhk73bw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBCC52833B17;
	Wed, 23 Nov 2022 14:07:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 795B82023A1D;
	Wed, 23 Nov 2022 14:07:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 14F9D1946A54;
	Wed, 23 Nov 2022 14:07:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 532061946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 23 Nov 2022 13:40:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 419A740C6F75; Wed, 23 Nov 2022 13:40:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A7B340C6EC5
 for <cluster-devel@redhat.com>; Wed, 23 Nov 2022 13:40:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E532185A78B
 for <cluster-devel@redhat.com>; Wed, 23 Nov 2022 13:40:10 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-142-uw9pCu5lMoCc4gFVlgDNqw-1; Wed, 23 Nov 2022 08:40:08 -0500
X-MC-Unique: uw9pCu5lMoCc4gFVlgDNqw-1
Received: by mail-ed1-f70.google.com with SMTP id
 x18-20020a05640226d200b00461e027f704so10415038edd.7
 for <cluster-devel@redhat.com>; Wed, 23 Nov 2022 05:40:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SNHhmVfjWC62dBHkktz2lKH8qamIk/lczkSRmxlEqVI=;
 b=u4JLqnqnpKL8wqaoKG2vSB9pFbATRV1pnc8jaamOhJUtDCNa+Sd05ysfR6appMwykk
 vlY8GynHqcoKm6YBQ3eHR3oaP3PFubynoo21K4JNYmzzv77rC5p7VxOGmbWLjQiVB9QD
 0mPZtPLL28sbT9TIWXIl8MSWc0sB9sTB4jPRd7fJ4+eAuScZzMYuJGiQTH/YTBrAbBxi
 daCUVhfcgOnuJpZ6Z9AMgVNmbfLuW1RFCgvgNl6dYop1D+eHjjz8K0/EMetgUraiZerw
 E+0DpQWROIZw3bi3MCjVlLRryaoFSCLeL+sOqMUS5S1tWgHaQfvJjIwND4wPP7Tw4m3o
 Z5Gw==
X-Gm-Message-State: ANoB5pl3Zzes/KKleYlpHejskEWvfCdNWCOGW57bhZXtcDOF1pQ6v91d
 JhKqg5kau4BuzYsP46hkKulPuj4H8zrH5q2R9vrNaVUKlFiPCNYKHk5PG6Rf3z2J5xCoQhQZabq
 IWvaNEC/MEJs9XxQhom1RdxQrjoFKxUsooP1pQA==
X-Received: by 2002:aa7:dd45:0:b0:45a:3c66:b0e4 with SMTP id
 o5-20020aa7dd45000000b0045a3c66b0e4mr26301513edw.33.1669210807041; 
 Wed, 23 Nov 2022 05:40:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7gzZQFA230BeIin7j0qKxuZe3sbEXZICJfqwgbe50BaZYLtBE6/nZoPy4vtGYoisx+/mQFisC850w0rm+Qf4I=
X-Received: by 2002:aa7:dd45:0:b0:45a:3c66:b0e4 with SMTP id
 o5-20020aa7dd45000000b0045a3c66b0e4mr26301496edw.33.1669210806830; Wed, 23
 Nov 2022 05:40:06 -0800 (PST)
MIME-Version: 1.0
References: <20221123065319.56756-1-zhengyongjun3@huawei.com>
In-Reply-To: <20221123065319.56756-1-zhengyongjun3@huawei.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 23 Nov 2022 08:39:55 -0500
Message-ID: <CAK-6q+gWK3g-g+6ox240hEmVQu2xjq4ZfxGdO9AHoqKG-5Myfw@mail.gmail.com>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH -next] fs: dlm: Fix build error without
 DEBUG_LOCK_ALLOC
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
Cc: cluster-devel@redhat.com, zhengbin13@huawei.com,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Nov 23, 2022 at 8:37 AM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:
>
> If CONFIG_DLM is y, DEBUG_LOCK_ALLOC is n, building fails:
>
> fs/dlm/lowcomms.o: In function `lowcomms_queue_rwork':
> lowcomms.c:(.text+0x2ac): undefined reference to `lockdep_is_held'
> lowcomms.c:(.text+0x308): undefined reference to `lockdep_is_held'
> fs/dlm/lowcomms.o: In function `lowcomms_queue_swork':
> lowcomms.c:(.text+0x3e0): undefined reference to `lockdep_is_held'
> fs/dlm/lowcomms.o: In function `restore_callbacks':
> lowcomms.c:(.text+0xd8c): undefined reference to `lockdep_is_held'
> lowcomms.c:(.text+0xdcc): undefined reference to `lockdep_is_held'
>
> Make DLM select DEBUG_LOCK_ALLOC to fix this.
>

Thanks, there is a different approach already in dlm/next and I think
we don't want to have dlm selecting a debug option.

- Alex

