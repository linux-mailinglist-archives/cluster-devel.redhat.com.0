Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A08F7A6C21
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Sep 2019 17:01:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 067EC18C893B;
	Tue,  3 Sep 2019 15:01:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5803C60166;
	Tue,  3 Sep 2019 15:01:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 751C11802217;
	Tue,  3 Sep 2019 15:01:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83F0wdH012613 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 11:00:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E2C8D60167; Tue,  3 Sep 2019 15:00:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E167E60566;
	Tue,  3 Sep 2019 15:00:53 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6B6F19CF89;
	Tue,  3 Sep 2019 15:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1567522847;
	bh=OPXfuz6hZTmeN92lthXJwSEGks6dVJYEddMSbODEvhU=;
	h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
	b=fenYEanL7PhoyyfbqRR6NNIRRhBOvFTDfVDw5sCh7MPIOgZ1k5Q3Lf3nCgZxi8nkr
	/JPN3lmPRdOgepYvuiPeXjdt7/imOEjmn4vDj4LTkjRboA7zaMrIRXrXiWeVKEURKx
	pHS4zvkwX287adttGsf1gsO+6SBnZVNeIjpDrebo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.133.43]) by smtp.web.de (mrweb103
	[213.165.67.124]) with ESMTPSA (Nemesis) id 0MCZlG-1hvquL07X8-009Rj7;
	Tue, 03 Sep 2019 17:00:47 +0200
To: =?UTF-8?Q?Andreas_Gr=c3=bcnbacher?= <andreas.gruenbacher@gmail.com>,
	cluster-devel <cluster-devel@redhat.com>
References: <9250af4a-993c-e86e-678c-acbd59b0861a@web.de>
	<CAHpGcMKEFaZBRNnt1edrvBMS6VUXs5hMdQ2BdNBE3ssgkmDoww@mail.gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
	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
	FEE=
Message-ID: <5e7b4313-c3e9-c3c8-8823-7c7a62a13fff@web.de>
Date: Tue, 3 Sep 2019 17:00:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAHpGcMKEFaZBRNnt1edrvBMS6VUXs5hMdQ2BdNBE3ssgkmDoww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Provags-ID: V03:K1:qV6f4zP12+vEo6H/OZQRq4hKVxbP3qWg4Gs4xLjmOAC5vUWL9qy
	BTDxxyg634lf6loPjkd0pau6rA7JshC0QjBOSFTnuTYOYliyV8qoIbHeO0STsYGAalalv1G
	P1aImUszc8sTKDjfP1k81VhKOfkWVx1dkb082qxj0SdAckBc0TTguW+u8cPfs1jjySuxrlx
	RVSydqkkAhKnPxqvVvUcw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0Kt3zNk5ano=:J3pocg5T/OBQAkkdT5pBfd
	NsnO4wsTxG9L1MM1yIWMcbt2y6IfhKpJNodzV6lQB3D5cv2OUQFK2g5Prw9hyElVnrF/R1QM1
	3aB66r7h4hI9Xl6tpkUGvSocbOiAFI7rLCYO9KjO2QU6rUI694p1ewb7z756Kyv7L4ouzmbPu
	cfR3flCFVw2VJsil7m64MD42omSzVJ9bIMBpMGIDgaTjKvNDcYECCXDPaS1+IlW+1hzEgutqr
	T6yJfinbW5j8HZvNBI8Wf6HDPHe1eHp8XPB8jI+xGvcdjjBl6hrAtIBfc+OyDXHmcZ4k7t003
	84c4p3X7ldnMLSPOD/lYhG5aijE4kWJ7M+JCVCVj2osTJuZtg+A9GfRz7cPzW6MiWNtMCzx4i
	TgSCkpDvZQ+ok6IBj8tNgK5t062z4U2+kTAPZEV1fv64RZi5ooaReopKt1eGI1nlAM9FOy0Pf
	3hlDPvHPhytn26beDYE7+crT6+mv6dJV32QMAsEpGq0UsB8tXS575d7G15kfDhytPZME5vWsZ
	4BhpczNVst7iV4YS7QTKM6G5/lx1nXGtykUy5+qdQ5kaey8VYNHe+UR3FEsMnVlRGG4rm2EzG
	vr5jqjtL3otAxonJz4tEISsgkgwX98Dge9tPXkgEKfI5yELQ7/Eg1iMNNJRJo27tjoCsKvNH0
	VInJIVKIY09/ff9pot+jsvPuZlX9nau1wRMT2bXQYjkw+ZZXV8Oo1tLJB5UVW9TegzpuvYfCV
	cTGRze0n/tTyBfRQGUoHs7CGLM7RONmLinTe39hR3ynG50RKvn+4GYVtB+aAH35hSusW5Lf1f
	YnPC4ddTc1SYbuOw+W2yvirBWaxSJ65TegBW6ws1bvukrOJq41xO9YJoWN8tZ2Sth4FXsJ8Yr
	PAdtc3/KcN8Xk2B7q8Hvt54+59CY9sLVvFvGeqvN32CALQvb8eug0JaHg/19d8i60Goc2e9aT
	IhKOI1Bqlspr5dE4u3KdH5tEQxIvjyE3aYN3OYNJQxuA01FaIQ+1oSF2K1XULaRHOOrjBlKgz
	H9lwagSb0qV/GAzshAm6SN5vpOfd89QAgzWfrFAzhU58kQ8ElDrQpbayGTPs6v6QfMsMjuWaR
	DgiJMAHZqujPUbDl5imLa8dmyE2FsXmWUhGx4NVP2l7FM9MUfqNMxoFLZaPKDNcLhzwddinB8
	5htz3cQ7CA6kadlvO5JTFpyy4V8EXhPybiEjnVn02WbVyq0Q==
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Tue, 03 Sep 2019 15:00:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Tue, 03 Sep 2019 15:00:52 +0000 (UTC) for IP:'212.227.17.12'
	DOMAIN:'mout.web.de' HELO:'mout.web.de'
	FROM:'Markus.Elfring@web.de' RCPT:''
X-RedHat-Spam-Score: -0.799  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 212.227.17.12 mout.web.de 212.227.17.12 mout.web.de
	<Markus.Elfring@web.de>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Content-Transfer-Encoding: 8bit
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x83F0wdH012613
X-loop: cluster-devel@redhat.com
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] gfs2: Delete an unnecessary check before
	brelse()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Tue, 03 Sep 2019 15:01:06 +0000 (UTC)

>> The brelse() function tests whether its argument is NULL
>> and then returns immediately.
>> Thus the test around the call is not needed.
>>
>> This issue was detected by using the Coccinelle software.
>
> The same applies to brelse() in gfs2_dir_no_add
> (which Coccinelle apparently missed),

Would you like to achieve that such source code analysis
will be extended to corresponding header files?
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/fs/gfs2/dir.h?id=7dc4585e03786f84d6e9dc16caa3ba5b8b44d986#n33


> so let me fix that as well.

Thanks for your positive feedback.

Regards,
Markus

