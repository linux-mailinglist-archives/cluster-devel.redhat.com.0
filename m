Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B60672B1E
	for <lists+cluster-devel@lfdr.de>; Wed, 24 Jul 2019 11:09:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1999C3091783;
	Wed, 24 Jul 2019 09:09:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A237F5D71A;
	Wed, 24 Jul 2019 09:09:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D6B941F40;
	Wed, 24 Jul 2019 09:09:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6O98mii030941 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jul 2019 05:08:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C6B711001B0F; Wed, 24 Jul 2019 09:08:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B43A10018F9;
	Wed, 24 Jul 2019 09:08:46 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 79DE2C1EB202;
	Wed, 24 Jul 2019 09:08:45 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id k189so1855824pgk.13;
	Wed, 24 Jul 2019 02:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=09CsS3ko6lzH/0V10YXQF8pRitb7C2CLQvJO5AREnSE=;
	b=V7bJdNy/iE/nCZXfk/Q/TCnAA34debDwTZZ1M4YDyiNLF6A5FE9wxdfYAvxN6rgiVO
	IUBynba+yRV/n7ePvcmhmYOj/PbxbakbGXO0zye+0AMCIuUhyR3U45Mb2hl9bZoZclvz
	MTWSfkANhFigy7uwXG6B7jzYuOOGYJY2zJjoXWokPFeZx9kcHyyfvXcNWCGk3T8iyNja
	Q/qoqYD1WhvhAe5ZM56ROmssx+3m3ifSr+VMYzqR6VNHVAIwh6wd6ZTdLv82y3Fgzwjb
	so/cAlhL1qfgy6MUqcEilF2uRZmFj1ybyonnqxcIdSizWUx7/szxnh71u9Y6m9MF/cjd
	INTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=09CsS3ko6lzH/0V10YXQF8pRitb7C2CLQvJO5AREnSE=;
	b=UFU8EXdiYhKjxgR2CX+BYYu38FeVmkv9OJLZXZ2GvyU0uOVxtOrx0pposNl0JG9P9+
	NRn0m/NkFVHV/tc4JN95ALsBhwduGXqmw/emxqmMFUwPoJ5YIl+JuXPtucyxvK2UXSr9
	Y0HB9K/iCsqe/v16OTCe6hxel9K4kNWJzU1wAi2ZOrG7nlFLXeIrkvWs4QMfzcirmTJb
	ci8kh3Uiqj1iv6keUr/Py5+57p6L3XPm4tx++Ufg5qDRZqCXzESeYWMVK9FkyuXygnTx
	Etx6xMLaCH4pQGEI3Mse8GutU+cRbIWkQ7jwrLDHngSwOb0AjpalN/BADlPvWj1reMyd
	j+Gw==
X-Gm-Message-State: APjAAAUiaxjNBKq/H3A8dCkJdyFh1nXSlsSqfAe05FtKn5jcqdIcIXnz
	S0bH0+90iFpQtcOqFH4o+nA=
X-Google-Smtp-Source: APXvYqxa+oNYmupFnZcbNaTroSq3yDCbTnIojD2SeB7FIypF8xyOhbA+keos0ryT6Z1Fyf/gaoZljQ==
X-Received: by 2002:a62:79c2:: with SMTP id
	u185mr10440507pfc.237.1563959325044; 
	Wed, 24 Jul 2019 02:08:45 -0700 (PDT)
Received: from ?IPv6:2402:f000:4:72:808::177e? ([2402:f000:4:72:808::177e])
	by smtp.gmail.com with ESMTPSA id
	o14sm93701300pfh.153.2019.07.24.02.08.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jul 2019 02:08:44 -0700 (PDT)
To: Steven Whitehouse <swhiteho@redhat.com>, rpeterso@redhat.com,
	agruenba@redhat.com
References: <8d270882-54da-365e-1be7-a291a5178b1e@gmail.com>
	<cd7c0bb4-53d2-8a67-0719-c26d043a31fc@redhat.com>
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <48547b12-ee4c-4f8c-d004-925d65f672d8@gmail.com>
Date: Wed, 24 Jul 2019 17:08:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cd7c0bb4-53d2-8a67-0719-c26d043a31fc@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 24 Jul 2019 09:08:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Wed, 24 Jul 2019 09:08:45 +0000 (UTC) for IP:'209.85.215.196'
	DOMAIN:'mail-pg1-f196.google.com'
	HELO:'mail-pg1-f196.google.com' FROM:'baijiaju1990@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.153  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.215.196 mail-pg1-f196.google.com 209.85.215.196
	mail-pg1-f196.google.com <baijiaju1990@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 24 Jul 2019 09:09:07 +0000 (UTC)

Thanks for the reply :)

On 2019/7/24 17:04, Steven Whitehouse wrote:
> Hi,
>
> On 24/07/2019 09:50, Jia-Ju Bai wrote:
>> In gfs2_rgrp_bh_get, there is an if statement on line 1191 to check 
>> whether "rgd->rd_bits[0].bi_bh" is NULL.
>
> That is how we detect whether the rgrp has already been read in, so 
> the function is skipped in the case that we've already read in the rgrp.
>
>
>> When "rgd->rd_bits[0].bi_bh" is NULL, it is used on line 1216:
>>     gfs2_rgrp_in(rgd, (rgd->rd_bits[0].bi_bh)->b_data);
>
> No it isn't. See line 1196 where bi_bh is set, and where we also bail 
> out (line 1198) in case it has not been set.
>

I overlooked the operation on line 1196...
Thanks for the pointer, I am sorry for the false report...


Best wishes,
Jia-Ju Bai

