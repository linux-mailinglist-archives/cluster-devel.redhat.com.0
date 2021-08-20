Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 963623F2838
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Aug 2021 10:17:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-9Uy3ThPkMnOlpEwlyFzMtA-1; Fri, 20 Aug 2021 04:17:42 -0400
X-MC-Unique: 9Uy3ThPkMnOlpEwlyFzMtA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61C001008065;
	Fri, 20 Aug 2021 08:17:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A059F1970F;
	Fri, 20 Aug 2021 08:17:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D56FB4BB7C;
	Fri, 20 Aug 2021 08:17:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17K8GDop020678 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 04:16:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0E8212021446; Fri, 20 Aug 2021 08:16:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 091EC20285BB
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 08:16:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DB458001EA
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 08:16:10 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-189-bbyniNfGNRGSZOBMAFu4-A-1; Fri, 20 Aug 2021 04:16:06 -0400
X-MC-Unique: bbyniNfGNRGSZOBMAFu4-A-1
Received: by mail-pj1-f44.google.com with SMTP id
	j10-20020a17090a94ca00b00181f17b7ef7so428678pjw.2; 
	Fri, 20 Aug 2021 01:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ecM/6ojxZtANL/C/M4VUBHGG8yziqnnJSVmQ/MwMgJU=;
	b=fkkjK5e9V5BYi6gCsn9k/85lOrsjKv/s5XvT8Tl/3SRjuoLlYMVfb5JDBGyeHVL+8E
	NK8b27BpvYjQoTtz5+hoBLnlKysqOMWw7gzLojlz/zNMixEmVhx021HJAVudjpU1jyWW
	RXjGq/32HSJb4vxs7R/CAuKOOXLYrNp/c8Z+yh0cCpvhYo3G3V58uG7HhtE9OvNPbfM8
	HXet7JzqqR84ppJXywOOYWTjY3XpIuoJciPqBzri8iNfkjDof3TuPVae6Et1V0ErJTM3
	iSWo4pC5sgHDBTu22lgWGofUmrK9RP8A3zevG2zMNLa+HWxUkmKs2GwvyuDBKtdQDqQy
	dhjg==
X-Gm-Message-State: AOAM5330C5wWbD2TyiZ9Mqf+bERnOcRVn6zNV63UeiU0vAwqahGl3FAF
	Sl0kSFc/CqVsNHRBHU3eLim8FGbfnHs=
X-Google-Smtp-Source: ABdhPJyCSGe/hfzAk/jJoivsKxpsVAEPc7XenK2xB+GtUdWIqsUhGpzvYjAu7Vc8MhOyAhOAOxtUOA==
X-Received: by 2002:a17:90a:2f44:: with SMTP id
	s62mr3374998pjd.222.1629447365080; 
	Fri, 20 Aug 2021 01:16:05 -0700 (PDT)
Received: from [10.133.0.54] ([85.203.23.237])
	by smtp.gmail.com with ESMTPSA id
	n15sm6081871pff.149.2021.08.20.01.16.02
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 20 Aug 2021 01:16:04 -0700 (PDT)
To: David Teigland <teigland@redhat.com>
References: <79f8d302-f53f-3891-965a-bcb460ab15ca@gmail.com>
	<20210819155509.GB21218@redhat.com>
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <fbf23736-26a7-7442-2c19-ae0bea25b296@gmail.com>
Date: Fri, 20 Aug 2021 16:16:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20210819155509.GB21218@redhat.com>
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [BUG] fs: dlm: possible ABBA deadlock
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2021/8/19 23:55, David Teigland wrote:
> On Thu, Aug 19, 2021 at 04:54:57PM +0800, Jia-Ju Bai wrote:
>> Hello,
>>
>> My static analysis tool reports a possible ABBA deadlock in the dlm
>> filesystem in Linux 5.10:
>>
>> dlm_recover_waiters_pre()
>>    mutex_lock(&ls->ls_waiters_mutex); --> line 5130
>>    recover_convert_waiter()
>>      _receive_convert_reply()
>>        lock_rsb()
>>          mutex_lock(&r->res_mutex); --> line 69
>>
>> dlm_recover_waiters_post()
>>    lock_rsb()
>>      mutex_lock(&r->res_mutex); --> line 69
>>    mutex_lock(&ls->ls_waiters_mutex); --> line 5307
>>
>> When dlm_recover_waiters_pre() and dlm_recover_waiters_post() are
>> concurrently executed, the deadlock can occur.
>>
>> I am not quite sure whether this possible deadlock is real and how to fix it
>> if it is real.
>> Any feedback would be appreciated, thanks :)
> They won't be concurrent, "pre" runs before recovery, and "post" is after.

Okay, thanks for your reply :)


Best wishes,
Jia-Ju Bai

