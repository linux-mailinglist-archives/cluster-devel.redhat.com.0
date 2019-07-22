Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 804E86FA6D
	for <lists+cluster-devel@lfdr.de>; Mon, 22 Jul 2019 09:36:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD8FB59451;
	Mon, 22 Jul 2019 07:36:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33E5A19C77;
	Mon, 22 Jul 2019 07:36:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 365484EA31;
	Mon, 22 Jul 2019 07:36:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6M6tKQl031558 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 22 Jul 2019 02:55:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D808B19D71; Mon, 22 Jul 2019 06:55:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74CD119C77;
	Mon, 22 Jul 2019 06:55:18 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5244E30BA078;
	Mon, 22 Jul 2019 06:55:17 +0000 (UTC)
Received: from [192.168.1.110] ([77.2.59.209]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1N63mC-1iVKPb3LNg-016NMH; Mon, 22 Jul 2019 08:55:15 +0200
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, ccaulfie@redhat.com,
	teigland@redhat.com
References: <20190721104322.30019-1-christophe.jaillet@wanadoo.fr>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <e561b3e8-e3da-b81c-2b06-3be4fa3d1c61@metux.net>
Date: Mon, 22 Jul 2019 08:55:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190721104322.30019-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:WUcKhSRu2LzHxsqlmB2enuu41lBDRBmM2VCO0NzFt7XwBzKQuiM
	3PEK+t7coQYBM8Bjdh2qETSuphYhiOZBL8qqOLimcvuNX/0ohijyDHhDtiIYy/2VEurSEZX
	Dt9D8rWPJ90wgPB4GHmsgONEj2AO2v/iRPcuk1bDM9zP3K13uLkkfuGh9KZFbmI1gSA9ExP
	SDd1nBVWLxHbb1NTZbVdQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sp/dw0gAHtc=:ox9lL5rXoR6AXdosyyp03k
	fZaPimwr1pX2ZTyY56vGvnBjFpw1spxhvik5RJaXZyF/Q8g/tkVvvmNBu1jLKuhDyLogZBDe2
	4QWGNFl6pU/PXc5T5xtgq3PPDfp9dia3rNDEhm4QvttX/y0bBk7Sx9BzjTEfrX0lZ3HhI/rZg
	ooVEvYbGjm5RtY9na6cZXJU0sqG9E+5qAkijdxRthXcAqPFWzpfHacMJkubsXq2XCu2NWVvOv
	C3z2sjn+KXzWJCJHsylP1DRbfoPmsrEz6A4sN7taq+CJyy0H2Bp44+f5Xtz0rEGZy9QZ3oX1x
	qnOD2D/GnbrxEHCAF+DapoViQKPUuJnm4/Xe4/MQAAHT+iUVC8IQi7Co6RRPDSr8lkZKUvUXy
	yW0dvsDyshxl3ppBprNOhfA/xeFxDJy5M5lh+sAV/Wame+HcvPpLKHr2LxvlLdD0H7tFqKCV6
	Eu2SzHwz0N7EWdc+RzNWhox087Foa7bWp8Y4mBYzsyO408XWOy4krYSIvz1Cl89NxbfAeLsrC
	iNnmyN7OcnHP7O3etYjtVF944kYm5623wvbfMzO0w+ao5WeqHRSgvg3Q47nAi98vgWT3yXs/U
	0GBGaKWvLu/5JwznwYEAQzjXGXeN3EPUh3p3AF7Jvl8NhBFF03GV4AZW/i9to/hkvbSFVk4rJ
	HdAYTloPfppo3KhLUWuyUCAbsi4a8mgThqIiWAY0gbKqhklo0k5wHoNrDCWoS5QTBVaOyrxf7
	KK+JoIIKhtHbXFQ4XmtRaoL7gfvWRaIfpudd8ylfy6jiIs0h8kltHLkGckc=
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Mon, 22 Jul 2019 06:55:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Mon, 22 Jul 2019 06:55:17 +0000 (UTC) for IP:'212.227.126.187'
	DOMAIN:'mout.kundenserver.de' HELO:'mout.kundenserver.de'
	FROM:'lkml@metux.net' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_NONE) 212.227.126.187 mout.kundenserver.de 212.227.126.187
	mout.kundenserver.de <lkml@metux.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 22 Jul 2019 03:36:24 -0400
Cc: cluster-devel@redhat.com, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH] dlm: fix a typo
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Mon, 22 Jul 2019 07:36:37 +0000 (UTC)

On 21.07.19 12:43, Christophe JAILLET wrote:
> s/locksapce/lockspace
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   fs/dlm/lockspace.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
> index 00fa700f4e83..9c95df8a36e9 100644
> --- a/fs/dlm/lockspace.c
> +++ b/fs/dlm/lockspace.c
> @@ -870,7 +870,7 @@ static int release_lockspace(struct dlm_ls *ls, int force)
>    * until this returns.
>    *
>    * Force has 4 possible values:
> - * 0 - don't destroy locksapce if it has any LKBs
> + * 0 - don't destroy lockspace if it has any LKBs
>    * 1 - destroy lockspace if it has remote LKBs but not if it has local LKBs
>    * 2 - destroy lockspace regardless of LKBs
>    * 3 - destroy lockspace as part of a forced shutdown
> 

Reviewed-By: Enrico Weigelt <info@metux.net>


-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

