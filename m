Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 052E8793737
	for <lists+cluster-devel@lfdr.de>; Wed,  6 Sep 2023 10:36:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693989407;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8kxl0a4T7fw0FkcqLI3LPI8DvJ1AdEWlSu5wSZFK0FM=;
	b=GoqtA71EEcgh2OLoB9513WHTa4uf0bFaJ1S7EW2eP/FyqC68vXbBmhKLw2svXkpt5MeyUa
	m7hGgtlV8+p0nZlRN2Mh4lKn/pFSTQbNvrd4FPtPRIjhKT24TDarSxHlsWzGHMRB6KjOSG
	LJBK+92zR3npfqyAyJrSMlQcA1sglZc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-686-RZFJjET-OP6fVFXX2IsI9w-1; Wed, 06 Sep 2023 04:36:44 -0400
X-MC-Unique: RZFJjET-OP6fVFXX2IsI9w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D28E38149B0;
	Wed,  6 Sep 2023 08:36:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DDFA20BAE72;
	Wed,  6 Sep 2023 08:36:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 94252194658F;
	Wed,  6 Sep 2023 08:36:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 393CB1946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  6 Sep 2023 08:36:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 170D6140E964; Wed,  6 Sep 2023 08:36:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F3CE140E950
 for <cluster-devel@redhat.com>; Wed,  6 Sep 2023 08:36:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E88A1181AAE0
 for <cluster-devel@redhat.com>; Wed,  6 Sep 2023 08:36:39 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-jMfSukYpMVSrFG-GT98Q-g-1; Wed, 06 Sep 2023 04:36:37 -0400
X-MC-Unique: jMfSukYpMVSrFG-GT98Q-g-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-31c6c275c83so1856534f8f.2
 for <cluster-devel@redhat.com>; Wed, 06 Sep 2023 01:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693989397; x=1694594197;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8kxl0a4T7fw0FkcqLI3LPI8DvJ1AdEWlSu5wSZFK0FM=;
 b=FIdepgV3fyf19nD6c19jQFLh6UCwvthyPOpEqARD2lefcaHzFEeXzyAFjV8stYBgJk
 wNpAJif1t4Fcon5hXgaT3yJlOfsTjpE5skDWMtJa2U1lOgR/1eAUG5WoJZNI78rQjdPe
 dR8QK6nPu1qxCg6o2KPyBTWpzIEhAvFUULgBTKfkLCtIONiw/EjAcw185wosrQDQ674d
 rR1LeHtfSi7UdjVTxQlMCUbxDkPf4nU15EkSY3kv15/jaNpalzkeUkwRDWTJd45sWt78
 E0Aj0oQxPq5pRzTRL+BTLylCDg2os2Dsupqc2GLYig4zQr22elvQNGtCIqxULySyY1dz
 GGsw==
X-Gm-Message-State: AOJu0Yz7wDW5J/beeeqZOOJRuv+Q8SZq11Q33kOChfN/tYxzuHYtx05e
 yUkEqV8ADpc/3gNn26JPpoNBcKUC/05b9/dVRtpohdGBgzqCq4fKRIw3CbXht8bbCy3bu0omLNq
 YmxHgrSHS1bn/cjcZLyBuPmirtpCDLzVLHrOCOT6v+qbGGpr24qL8gX+4VUu6Tq1huJ509VIXJz
 Ru0M1S
X-Received: by 2002:adf:f106:0:b0:319:6d20:49c7 with SMTP id
 r6-20020adff106000000b003196d2049c7mr1970075wro.3.1693989396905; 
 Wed, 06 Sep 2023 01:36:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFovfwa+rNzl6czUglrSJTNG8ZOkBhlMPLZKJyE4MkoRjEEuhGKhjJyrYPse3cVSXxQhy3ecA==
X-Received: by 2002:adf:f106:0:b0:319:6d20:49c7 with SMTP id
 r6-20020adff106000000b003196d2049c7mr1970055wro.3.1693989396597; 
 Wed, 06 Sep 2023 01:36:36 -0700 (PDT)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a5d4ecc000000b0031423a8f4f7sm19895490wrv.56.2023.09.06.01.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Sep 2023 01:36:35 -0700 (PDT)
Message-ID: <91aae40f-deed-1637-b083-764a5dff4a41@redhat.com>
Date: Wed, 6 Sep 2023 09:36:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Price <anprice@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
References: <9830d291-a86b-df63-0b03-c99c583609c8@redhat.com>
In-Reply-To: <9830d291-a86b-df63-0b03-c99c583609c8@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [ANNOUNCE] Goodbye cluster-devel,
 hello gfs2@lists.linux.dev
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
Cc: gfs2@lists.linux.dev, linux-fsdevel <linux-fsdevel@vger.kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/08/2023 18:07, Andrew Price wrote:
> Hi all,
> 
> As cluster-devel is now only used for gfs2 and dlm development, we will 
> be moving them to a new list hosted by kernel.org alongside other Linux 
> subsystems' lists. The new list is gfs2@lists.linux.dev and it will be 
> used for both gfs2 and dlm development.
> 
> The Linux MAINTAINERS file and other references will be updated shortly 
> to reflect the change. Information about the list hosting can be found 
> here:

Updates to the MAINTAINERS file have now been merged into mainline so 
gfs2@lists.linux.dev is now the official mailing list for gfs2 and dlm 
development.

(CC+ linux-fsdevel for awareness.)

Thanks,
Andy


> https://subspace.kernel.org/lists.linux.dev.html
> 
> To subscribe, send an email (the subject and body doesn't matter) to:
> 
> Subscribe:   gfs2+subscribe@lists.linux.dev
> Unsubscribe: gfs2+unsubscribe@lists.linux.dev
> 
> If you prefer, the list can also be read via NNTP at:
> 
> nntp://nntp.lore.kernel.org/dev.linux.lists.gfs2
> 
> The archives can be found here:
> 
> https://lore.kernel.org/gfs2/
> 
> and filters can use the "List-Id: <gfs2.lists.linux.dev>" header.
> 
> Thanks,
> Andy

