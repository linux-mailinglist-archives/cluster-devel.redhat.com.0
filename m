Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D398F365437
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Apr 2021 10:34:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618907693;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DLnZ5pJU/O9kvXvDAV95kWyruNsM1OQHX9Gs52ltTDY=;
	b=HUK1+NMSqSCB4yS7dcitJdKzXpoukFVftg8aosq2SE/MsgBL93UV67nddwchlQ1SS0IwA5
	OhVN6HskzM2qA1p+OYdED/WbkLEuiJRzbf8Dkr9Mrb1+1xfJ7MhyIAuhWzIUDAhT1eRzvu
	SecNrkCg6trTl8P+eoMNoelGRDziRE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-o-2RqIlNNxmRzRFhbnlA7g-1; Tue, 20 Apr 2021 04:34:51 -0400
X-MC-Unique: o-2RqIlNNxmRzRFhbnlA7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BBC28030A0;
	Tue, 20 Apr 2021 08:34:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EC8B1002EF0;
	Tue, 20 Apr 2021 08:34:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D2E044A5B;
	Tue, 20 Apr 2021 08:34:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13K8Yghb002620 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Apr 2021 04:34:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2CC385D760; Tue, 20 Apr 2021 08:34:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.37.46] (unknown [10.33.37.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97D265D756;
	Tue, 20 Apr 2021 08:34:38 +0000 (UTC)
To: Andreas Gruenbacher <agruenba@redhat.com>
References: <20210419191117.297653-1-anprice@redhat.com>
	<20210419191117.297653-2-anprice@redhat.com>
	<CAHc6FU6+DNareW3Zb_=A9vsct07CcSm9DOcWWoiyv0Pg7NO=kQ@mail.gmail.com>
	<9472a989-1265-65d2-292b-5110176c15c6@redhat.com>
	<CAHc6FU5xAryzhtp+yniEU=cLaZH=mu1+woc76YLo_NrsRMj+iw@mail.gmail.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <8ac4383c-c510-203a-8a47-834c218b1d97@redhat.com>
Date: Tue, 20 Apr 2021 09:34:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHc6FU5xAryzhtp+yniEU=cLaZH=mu1+woc76YLo_NrsRMj+iw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 1/8] Import linux/gfs2_ondisk.h
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20/04/2021 07:00, Andreas Gruenbacher wrote:
> On Mon, Apr 19, 2021 at 10:47 PM Andrew Price <anprice@redhat.com> wrote:
>> On 19/04/2021 20:35, Andreas Gruenbacher wrote:
>>> Andy,
>>>
>>> On Mon, Apr 19, 2021 at 9:11 PM Andrew Price <anprice@redhat.com> wrote:
>>>> diff --git a/gfs2/include/gfs2_ondisk.h b/gfs2/include/gfs2_ondisk.h
>>>> new file mode 100644
>>>> index 00000000..fc948f89
>>>> --- /dev/null
>>>> +++ b/gfs2/include/gfs2_ondisk.h
>>>
>>> any reason why this file shouldn't be at gfs2/include/linux/gfs2_ondisk.h?
>>
>> I didn't feel it was needed, but it does have the benefit of making sure
>> we're not picking up the system linux/gfs2_ondisk.h when we #include
>> <gfs2_ondisk.h> and it shows clearly that we're not trying to.
> 
> Well, we have "-I$(top_srcdir)/gfs2/include" in CPPFLAGS so
> gfs2/include/linux/types.h is picked up by <linux/types.h>. We already
> rely on that working. So gfs2/include/linux/gfs2_ondisk.h would be
> picked up by <linux/gfs2_ondisk.h> already anyway.

So, what would be the advantage of having gfs2_ondisk.h in
gfs2/include/linux/? I put types.h in that directory because I didn't 
want to change the #include statement, but I didn't see a reason to put 
gfs2_ondisk.h in there.

Andy

