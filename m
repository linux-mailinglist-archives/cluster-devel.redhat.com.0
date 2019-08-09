Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A9487AEA
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Aug 2019 15:15:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C7CFC08E282;
	Fri,  9 Aug 2019 13:15:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04A0960C5D;
	Fri,  9 Aug 2019 13:15:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD0862551C;
	Fri,  9 Aug 2019 13:15:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x79DDiEW022312 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Aug 2019 09:13:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 78AFC5C557; Fri,  9 Aug 2019 13:13:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72A7E5C3FA;
	Fri,  9 Aug 2019 13:13:41 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7944970F1;
	Fri,  9 Aug 2019 13:13:31 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x79D8PK8009842; Fri, 9 Aug 2019 13:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : mime-version : content-type; s=corp-2019-08-05;
	bh=4ailbpbRvTudTJvqRfozYesa9KhrVA7iMs/r0Utxeys=;
	b=eQl3oPx+4Qt5Tzt3bYJNF8aVM/uAupTHGvM+GwFmYskY4lbFDeeMl+g4jo/oAGay3B+F
	GcUPXPkR24j7MkV50jb/hJnz08hkjSUNJZfyamWmJ4wCs7+CLaTIZe7tGeHFkMiuS2VP
	bcrI4b2vZzKPIAvwLbvaZxK7mesN/kW1y9T/ba4k5QJT5EvKxTfNIQlIW6iBIuFUvY3s
	fWJ0B3kAGwH3ykz8JXUGY77plK7tK/FJOF2HcFrpPSC+ELYE/JwLtG/PySl3qrMMppE2
	Y3AsfE3HAkF8sRZzy68sC1xLQwNQAMIm1AeNMUPeH+UEOdDXlhIR6FcVSFz8wAnnot0N
	aQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : mime-version : content-type; s=corp-2018-07-02;
	bh=4ailbpbRvTudTJvqRfozYesa9KhrVA7iMs/r0Utxeys=;
	b=Q3lyjI6wGaMU8gC8c9vh/W35KG/zCaivobCPyqncCRmU1QSYrQlPASYPaiuhRaqDmwrL
	baPFVXSqPaG41vCiqwAxnJ9n1UXT5LSYGJ7M4SMu3Khq6sN8oC/4Gffn5q1mzh2R3bcK
	2X86vXvSH5mJ5buBBdpwoHdATdQmALJODbFuTuVLCFZOegOoDV+MJDUYu0o4a2EwV3fG
	LGibzYrw21YwtFVeaCRj1ZNlzWtJLyQcCR+ZZ72q5rdoXJXCZ65cEweBDBv+sud20qk0
	dqLO76e3U8ZuSgZuCqNJ/zSVgcpLUyVvoS/K+8wa4sLB6pOIZK/G9BFbQgvevtTfdrze
	nQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2120.oracle.com with ESMTP id 2u8hgp7bpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Aug 2019 13:13:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x79DCrhH086830; Fri, 9 Aug 2019 13:13:30 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3020.oracle.com with ESMTP id 2u8x9fg5cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Aug 2019 13:13:30 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x79DDTNp019613;
	Fri, 9 Aug 2019 13:13:29 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 09 Aug 2019 06:13:29 -0700
Date: Fri, 9 Aug 2019 16:13:23 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: rpeterso@redhat.com
Message-ID: <20190809131323.GA11448@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9343
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=535
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1906280000 definitions=main-1908090136
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9343
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=582
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
	definitions=main-1908090135
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Fri, 09 Aug 2019 13:13:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Fri, 09 Aug 2019 13:13:37 +0000 (UTC) for IP:'156.151.31.85'
	DOMAIN:'userp2120.oracle.com' HELO:'userp2120.oracle.com'
	FROM:'dan.carpenter@oracle.com' RCPT:''
X-RedHat-Spam-Score: -99.401  (BIGNUM_EMAILS, DKIMWL_WL_HIGH, DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	SPF_NONE, UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.85 userp2120.oracle.com 156.151.31.85
	userp2120.oracle.com <dan.carpenter@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [bug report] gfs2: dump fsid when dumping glock
	problems
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 09 Aug 2019 13:15:58 +0000 (UTC)

Hello Bob Peterson,

The patch 3792ce973f07: "gfs2: dump fsid when dumping glock problems"
from May 9, 2019, leads to the following static checker warning:

	fs/gfs2/glock.c:1796 gfs2_dump_glock()
	error: format string overflow. buf_size: 270 length: 277

fs/gfs2/glock.c
  1785  void gfs2_dump_glock(struct seq_file *seq, struct gfs2_glock *gl, bool fsid)
  1786  {
  1787          const struct gfs2_glock_operations *glops = gl->gl_ops;
  1788          unsigned long long dtime;
  1789          const struct gfs2_holder *gh;
  1790          char gflags_buf[32];
  1791          char fs_id_buf[GFS2_FSNAME_LEN + 3 * sizeof(int) + 2];
                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is the same as sizeof(sdp->sd_fsname);

  1792          struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
  1793  
  1794          memset(fs_id_buf, 0, sizeof(fs_id_buf));
  1795          if (fsid && sdp) /* safety precaution */
  1796                  sprintf(fs_id_buf, "fsid=%s: ", sdp->sd_fsname);
                                            ^^^^^  ^^
So if sd_fsname is as large as "possible" we could be 7 characters over
the limit.

  1797          dtime = jiffies - gl->gl_demote_time;
  1798          dtime *= 1000000/HZ; /* demote time in uSec */
  1799          if (!test_bit(GLF_DEMOTE, &gl->gl_flags))
  1800                  dtime = 0;
  1801          gfs2_print_dbg(seq, "%sG:  s:%s n:%u/%llx f:%s t:%s d:%s/%llu a:%d "

See also:
fs/gfs2/util.c:184 gfs2_consist_rgrpd_i() error: format string overflow. buf_size: 270 length: 277
fs/gfs2/rgrp.c:2293 gfs2_rgrp_error() error: format string overflow. buf_size: 270 length: 277

regards,
dan carpenter

