Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 74E0E3655B7
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Apr 2021 11:47:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618912070;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hUEkhbA+hNxi9uct7UP5dkyteOPBySKx3IWnlwg68wM=;
	b=TFwriUZRm70HR6ZH4aH0wuu64rWMAjQ729fVq+m2xHXs6G8bvavtPF3gjmPGvG0g20wSak
	lIqFmso5InnGcsBxzaQqQkzrlr94cZi/vUv+3GZVysOFfKPIcOJ1IVVgUWMlWzH3yunYyv
	5s9SwSVWuLdHqE83m+q9yU+N1lVUIx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-UyEs8OUuOySTvaS0d0kjxg-1; Tue, 20 Apr 2021 05:47:49 -0400
X-MC-Unique: UyEs8OUuOySTvaS0d0kjxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA7F18143FE;
	Tue, 20 Apr 2021 09:47:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4199D610F3;
	Tue, 20 Apr 2021 09:47:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA2531806D17;
	Tue, 20 Apr 2021 09:47:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13K9ldB0008831 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Apr 2021 05:47:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 29E0E50F89; Tue, 20 Apr 2021 09:47:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.37.46] (unknown [10.33.37.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 181BB5944F;
	Tue, 20 Apr 2021 09:47:32 +0000 (UTC)
To: Andreas Gruenbacher <agruenba@redhat.com>
References: <20210419191117.297653-1-anprice@redhat.com>
	<20210419191117.297653-2-anprice@redhat.com>
	<CAHc6FU6+DNareW3Zb_=A9vsct07CcSm9DOcWWoiyv0Pg7NO=kQ@mail.gmail.com>
	<9472a989-1265-65d2-292b-5110176c15c6@redhat.com>
	<CAHc6FU5xAryzhtp+yniEU=cLaZH=mu1+woc76YLo_NrsRMj+iw@mail.gmail.com>
	<8ac4383c-c510-203a-8a47-834c218b1d97@redhat.com>
	<CAHc6FU4dNtA6Tj-r=sT-WuQxabn4WoUh26GQh+WMt+TYsoYPDQ@mail.gmail.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <19d7d492-4cee-9d7c-994a-0830253abd2b@redhat.com>
Date: Tue, 20 Apr 2021 10:47:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHc6FU4dNtA6Tj-r=sT-WuQxabn4WoUh26GQh+WMt+TYsoYPDQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20/04/2021 10:07, Andreas Gruenbacher wrote:
> On Tue, Apr 20, 2021 at 10:34 AM Andrew Price <anprice@redhat.com> wrote:
>> On 20/04/2021 07:00, Andreas Gruenbacher wrote:
>>> On Mon, Apr 19, 2021 at 10:47 PM Andrew Price <anprice@redhat.com> wrote:
>>>> On 19/04/2021 20:35, Andreas Gruenbacher wrote:
>>>>> Andy,
>>>>>
>>>>> On Mon, Apr 19, 2021 at 9:11 PM Andrew Price <anprice@redhat.com> wrote:
>>>>>> diff --git a/gfs2/include/gfs2_ondisk.h b/gfs2/include/gfs2_ondisk.h
>>>>>> new file mode 100644
>>>>>> index 00000000..fc948f89
>>>>>> --- /dev/null
>>>>>> +++ b/gfs2/include/gfs2_ondisk.h
>>>>>
>>>>> any reason why this file shouldn't be at gfs2/include/linux/gfs2_ondisk.h?
>>>>
>>>> I didn't feel it was needed, but it does have the benefit of making sure
>>>> we're not picking up the system linux/gfs2_ondisk.h when we #include
>>>> <gfs2_ondisk.h> and it shows clearly that we're not trying to.
>>>
>>> Well, we have "-I$(top_srcdir)/gfs2/include" in CPPFLAGS so
>>> gfs2/include/linux/types.h is picked up by <linux/types.h>. We already
>>> rely on that working. So gfs2/include/linux/gfs2_ondisk.h would be
>>> picked up by <linux/gfs2_ondisk.h> already anyway.
>>
>> So, what would be the advantage of having gfs2_ondisk.h in
>> gfs2/include/linux/? I put types.h in that directory because I didn't
>> want to change the #include statement, but I didn't see a reason to put
>> gfs2_ondisk.h in there.
> 
> It's more consistent if the definitions are always included as
> <linux/gfs2_ondisk.h> by the kernel and by all user-space programs.

Hmm, I guess. I've moved it into gfs2/include/linux/ in my local branch 
and I'll push it with that change later, barring objections.

Andy

